# :nodoc:
module NobleNames
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end
  end

  # Here you can configure how the module behaves.
  # @example Only use german
  #   NobleNames.configure do |config|
  #     config.languages = :german
  #   end
  # @example Use multiple languages
  #   NobleNames.configure do |config|
  #     config.languages = [:german, :spanish]
  #   end
  def self.configure
    yield(configuration)
  end

  # The Configuration-Class for NobleNames,
  # Here you can set the languages you want supported.
  class Configuration
    def initialize
      @languages = [:all]
    end

    # Setter for `@languages`.
    # @param [Symbol] languages is turned into an `Array`.
    def languages=(languages)
      @languages = Array(languages)
    end

    # Returns all supported languages if `@languages` is set to
    # `:all`. Returns the configured languages otherwise
    # @return [Array] languages an array of language symbols.
    def languages
      @languages == [:all] ? SUPPORTED_LANGUAGES : @languages
    end
  end
end
