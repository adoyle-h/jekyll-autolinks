.PHONY: test
test:
	bundle exec rake test

.PHONY: install
install: init vendor/bundle

.PHONY: init
init:
	bundle config set --local path 'vendor/bundle'

.PHONY: clean
clean:
	rm -rf vendor

vendor/bundle:
	bundle install
