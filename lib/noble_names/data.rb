require 'yaml'

module NobleNames
  module Data
    DATA_PATH = File.expand_path('../../../data/', __FILE__).freeze
    MATCH_DATA =  Hash[Dir.glob(DATA_PATH + '/*.yml').collect do |f|
      yaml = YAML.load_file(f)
      yaml.first
    end]

    def self.particles
      select_languages(MATCH_DATA['particles'])
    end

    def self.prefixes
      select_languages(MATCH_DATA['prefixes'])
    end

    private

    def self.select_languages(collection)
      collection
        .select { |lang| NobleNames.configuration.languages.include? lang.to_sym }
        .values
        .flatten
    end
  end
end
