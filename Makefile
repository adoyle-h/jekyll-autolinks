.PHONY: test
test:
	bundle exec rake test

.PHONY: install
install: init vendor/bundle

.PHONY: init
init:
	bundle config set --local path 'vendor/bundle'

.PHONY: build
build:
	bundle exec rake build

.PHONY: release
release:
	bundle exec rake release

.PHONY: clean
clean:
	rm -rf vendor

vendor/bundle:
	bundle install
