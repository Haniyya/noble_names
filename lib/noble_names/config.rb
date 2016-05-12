module NobleNames
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
      @configuration
    end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_reader :languages

    def initialize
      @languages = [:english, :german]
    end

    def languages=(languages)
      @languages = languages.respond_to?(:each) ? languages : [languages]
    end
  end
end

