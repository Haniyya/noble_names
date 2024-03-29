# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noble_names/version'

Gem::Specification.new do |spec|
  spec.name          = 'noble_names'
  spec.version       = NobleNames::VERSION
  spec.authors       = ['Paul Martensen']
  spec.email         = ['paul.martensen@gmx.de']
  spec.required_ruby_version = '>= 2.6.0'

  spec.summary = <<-SUM
    A gem that titleizes strings while respecting certain linguistic differences.
  SUM

  spec.description = <<-DESC
    This Gem uses a list of nobility particles to keep track of what to
    capitalize and what not.
  DESC

  spec.homepage      = 'https://github.com/Haniyya/noble_names'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise 'RubyGems 2.0 or newer is require.' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`
               .split("\x0")
               .reject do |f|
    f.match(%r{^(test|spec|features)/|.*\.gem})
  end
  spec.require_paths = ['lib']
  spec.executables = []

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'flay', '~> 2'
  spec.add_development_dependency 'minitest', '~> 5'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rubocop', '~> 1.28'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.17'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
