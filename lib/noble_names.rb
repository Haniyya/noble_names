require 'noble_names/version'
require 'noble_names/config'
require 'noble_names/initializer'
require 'yaml'

# {include:file:README.md}
module NobleNames
  SUPPORTED_LANGUAGES =
    [:german, :english, :french, :spanish, :portuguese].freeze

  DATA_PATH = File.expand_path('../../data/', __FILE__).freeze

  PARTICLES = YAML.load_file(File.expand_path(
                               'particles.yml', DATA_PATH
  ))['particles'].freeze

  # Capitalizes a word if it needs to be capitalized.
  # @param [String] word the word that needs to be capitalized.
  # @param [String] word the word either capitalized or not.
  def self.noble_capitalize(word)
    in_particle_list?(word) ? word : word.capitalize
  end

  # Checks weither a word is in the nobility particle list.
  # @param [String] word the word that is checked.
  # @return [Boolean] `true` if `word` is in the particle_list,
  #   `false` otherwise.
  def self.in_particle_list?(word)
    particles = PARTICLES
                .select do |lang|
                  NobleNames.configuration.languages.include?(lang.to_sym)
                end
                .values.flatten
    particles.include? word
  end

  # Applies the core extension
  initialize
end
