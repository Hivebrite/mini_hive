#!/usr/bin/env python3

# This script is used to sync the origin repository to all target repositories.
#
# DEVELOPMENT NOTE
# To test the script in local without touch the production repositories)
# you can use the following command:
#   mkdir TMP && cd TMP && python3 ../.buildkite/sync_to_target_repositories.py

import os
import subprocess
import yaml
from shared_libraries.helpers.logger import Logger


# BASE_PATH is the path to the directory containing the git-template-repository
BASE_PATH = (
    subprocess.check_output("git rev-parse --show-cdup", shell=True).rstrip().decode()
)
# CONFIG_PATH is the path of the configurable file containing the list of target_repositories to exclude
CONFIG_PATH = ".github/sync_repo_config.yaml"
# DEV_REPOSITORY is the name of the repository to sync to for development
DEV_REPOSITORY = "Hivebrite/dev-repo-destructive-operations"
# TARGET_REPOSITORY is the list of the repository to sync to
TARGET_REPOSITORIES = (
    [
        DEV_REPOSITORY,
        "Hivebrite/alumni_connect",
        "Hivebrite/analytics-cloud-functions",
        "Hivebrite/analytics-dbt",
        "Hivebrite/analytics-looker",
        "Hivebrite/android_app",
        "Hivebrite/argolib",
        "Hivebrite/build-automation",
        "Hivebrite/customer-analytics-looker",
        "Hivebrite/data-management-operator",
        "Hivebrite/document_schemas",
        "Hivebrite/email_renderer",
        "Hivebrite/email-services",
        "Hivebrite/functionnal-monitoring-tests",
        "Hivebrite/gohive",
        "Hivebrite/gohive-builder",
        "Hivebrite/hivebrite_js",
        "Hivebrite/hivebrite-mobile",
        "Hivebrite/hivecli",
        "Hivebrite/hivelog",
        "Hivebrite/hivetools-go",
        "Hivebrite/hivetools-ruby",
        "Hivebrite/html-content-service",
        "Hivebrite/ios_app",
        "Hivebrite/k8s",
        "Hivebrite/kthive",
        "Hivebrite/kubexit",
        "Hivebrite/load-testing",
        "Hivebrite/multi_table_finder",
        "Hivebrite/on-call-playbook",
        "Hivebrite/onboarding",
        "Hivebrite/organization-settings-sync",
        "Hivebrite/pci_payment",
        "Hivebrite/protorepo",
        "Hivebrite/shared-libraries",
        "Hivebrite/whitelabel",
        "Hivebrite/audit-logs",
        "Hivebrite/cloudflare-workers",
    ]
    if os.environ.get("ENVIRONMENT") == "production"
    else [DEV_REPOSITORY]
)

Logger = Logger(__name__)


class TargetRepo:
    def __init__(self, name, url):
        self.name = name
        self.url = url
        self.path = self.clone()
        self.config = self.load_sync_repo_config()

    def load_sync_repo_config(self):
        try:
            with open(BASE_PATH + CONFIG_PATH, "r") as stream:
                return yaml.safe_load(stream)
        except Exception as exc:
            Logger.error(exc)
            return {"excludesPaths": []}

    def clone(self):
        Logger.info(f"Cloning {self.name}")
        os.system(f"git clone --depth 1 git@github.com:{self.url}.git /tmp/{self.name}")
        return f"/tmp/{self.name}"

    def cleanup(self):
        Logger.info(f"Cleaning up {self.name}")
        os.system(f"rm -rf {self.path}")

    def excludesPaths(self):
        excludesPaths = [CONFIG_PATH]
        excludesPaths.extend(self.config.get("excludesPaths", []))
        return excludesPaths


class SyncToTargetRepositories:
    def __init__(self):
        self.target_repositories = []

    def excludesPaths(self):
        return [".git", "Makefile", "README.md", ".buildkite", ".gitignore"]

    def run(self):
        try:
            Logger.info(
                f"~~~ Running sync repo to repo for {len(TARGET_REPOSITORIES)} repositories"
            )

            Logger.info("~~~ Clone target repositories")
            for repo in TARGET_REPOSITORIES:
                self.target_repositories.append(TargetRepo(repo.split("/")[1], repo))

            Logger.info("~~~ Sync repositories")
            for repo in self.target_repositories:
                # Sync folder fron origin repo to target repo and exclude
                # files from sync_repo_config
                Logger.info(f"Sync {repo.name}")
                # Default exclude files
                excludeRule = ""
                for file in repo.excludesPaths() + self.excludesPaths():
                    excludeRule += f"--exclude {file} "
                os.system(
                    f"rsync --filter=':- .gitignore' -av {excludeRule}./ {repo.path}/"
                )

            Logger.info("~~~ Commit changes")
            for repo in self.target_repositories:
                os.chdir(repo.path)
                Logger.info(f"Commit and push changes to {repo.name}")
                os.system("git add .")
                os.system(
                    f'git commit -m "chore: sync repository from git-template-repository [skip ci]"'
                )
                os.system("git push")
        except Exception as exc:
            Logger.error(exc)
        finally:
            Logger.info("~~~ Clean target repositories")
            for repo in self.target_repositories:
                repo.cleanup()
            Logger.info("~~~ Done")


if __name__ == "__main__":
    SyncToTargetRepositories().run()
