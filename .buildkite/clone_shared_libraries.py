#!/usr/bin/env python3

import os
import subprocess

# BASE_PATH is the path to the directory containing the git-template-repository
BASE_PATH = (
    subprocess.check_output("git rev-parse --show-cdup", shell=True).rstrip().decode()
)

# REPOSITORY is the name of the repository of shared-libraries to clone
REPOSITORY = "Hivebrite/shared-libraries"
BRANCH = "improvement/commands"
DESTINATION = f"{BASE_PATH}.buildkite/shared_libraries"


class CloneShareLibraries:
    def __init__(self, repository, branch, destination):
        self.REPOSITORY = repository
        self.BRANCH = branch
        self.DESTINATION = destination

    def run(self):
        print("~~~ Cloning shared libraries")
        os.system(
            f"""
          git clone -b {self.BRANCH} --depth 1 git@github.com:{REPOSITORY}.git {self.DESTINATION}
          cd {self.DESTINATION} && make init && cd -
        """
        )


if __name__ == "__main__":
    CloneShareLibraries(REPOSITORY, BRANCH, DESTINATION).run()
