module NobleNames
  class << self
    attr_writer :configuration

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
    def initialize
      @languages = [:all]
    end

    def languages=(languages)
      @languages = Array(languages)
    end

    def languages
      @languages == [:all] ? SUPPORTED_LANGUAGES : @languages
    end
  end
end
