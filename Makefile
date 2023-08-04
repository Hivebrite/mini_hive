init:
	echo "~~~ Clone shared librairies"
	python3 .buildkite/clone_shared_libraries.py

lint-and-autocorrect:
	docker run --rm -v $(shell pwd):/data europe-docker.pkg.dev/ss-automation-7176/registry-docker-europe/cytopia/black:latest-0.3 .buildkite

lint-diff:
	git diff main --exit-code -- '*.py' > /dev/null || docker run --rm -v $(shell pwd):/data cytopia/black:latest-0.3 --check --diff --color .buildkite --exclude=shared_libraries

sync:
	python3 .buildkite/sync_to_target_repositories.py

test-sync:
	rm -rf dev-repo-destructive-operations
	make sync
