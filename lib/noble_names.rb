require 'noble_names/version'
require 'noble_names/initializer'

module NobleNames
  class << self
    attr_accessor :configuration

    def configure(&block)
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

  class Configuration
    attr_reader :languages

    def initialize
      @languages = [:english]
    end

    def languages=(languages)
      @languages ||= []
      @languages = @languages + languages.map(&:to_sym)
    end
  end
end
