require 'yaml'

module NobleNames
  # The module responsible for maintaining and delivering
  # the match data as defined in the `data` directory.
  module Data
    DATA_PATH = File.expand_path('../../../data/', __FILE__).freeze
    MATCH_DATA = Hash[Dir.glob(DATA_PATH + '/*.yml').collect do |f|
      yaml = YAML.load_file(f)
      yaml.first
    end]

    def self.particles
      select_languages(MATCH_DATA['particles'])
    end

    def self.prefixes
      select_languages(MATCH_DATA['prefixes'])
    end

    def self.select_languages(collection)
      collection
        .select { |l| NobleNames.configuration.languages.include? l.to_sym }
        .values
        .flatten
    end
  end
end
