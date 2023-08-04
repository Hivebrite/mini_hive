# GIT Template Repository

[![Build status](https://badge.buildkite.com/c19a5d6da1f732ca8a5c3f7144266560861f5a0c96c0ac3150.svg?branch=main)](https://buildkite.com/hivebrite/git-template-repository)

This is a template repository for a new GIT repository. It is intended to be
used as a starting point for a new GIT repository.

## ⚠️ IMPORTANT NOTICE ⚠️

**Any file of this repository will REPLACE already present file in target repositories. Be careful when you add files.**

To prevent the synchronisation of a specific file (also called: override file, or "Oh no my file is vanished 😢") you can add the path of the file in the [config_file](.github/sync_repo_config.yaml) under the `excludePaths` key on the target repository. Folder `.git`, `.buildkite` and the file `README.md` are always excluded

**NOTE:** Internally, we use the rsync command with `exclude` flag.

## Usage

This repository is synchronised with the repositories defined in `.buildkite/sync_to_target_repositories.py` file under the `TARGET_REPOSITORIES` variable.
All files and folders present in this repository are automatically pushed to all defined repositories on the default branch.

---

## How to test the sync process locally

Update some files and run the following command:

```sh
make test-sync
```

Then go to our [fake repository](https://github.com/Hivebrite/dev-repo-destructive-operations) and check the diff on the latest commit.

You can also check the git history locally using the following commands:

```sh
cd dev-repo-destructive-operations
git diff @~ @
```

## How to test conventional commit rules locally

Install the dependencies

```sh
npm install --save-dev @commitlint/{cli,config-conventional}
```

Then iterate using the following command:

```
echo "doc: improvement readme [PN-42]" | npx commitlint ---config .github/workflows/commitlint.config.js
```

Note: the previous command fails because the scope does not respect the rules: doc instead of docs

The full documentation and rules can be found [here](https://commitlint.js.org).
