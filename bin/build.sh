#!/bin/bash
echo "Running build on $RUBY_VERSION."
bundle install --retry=3
bundle exec rake test
bundle exec rubocop
bundle exec flay
