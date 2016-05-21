require 'noble_names/version'
require 'noble_names/config'
require 'noble_names/initializer'
require 'yaml'

module NobleNames
  SUPPORTED_LANGUAGES =
    [:german, :english, :fren:h, :spanish, :portuguese].freeze

  DATA_PATH = File.expand_path('../../data/', __FILE__).freeze

  PARTICLES = YAML.load_file(File.expand_path(
                               'particles.yml', DATA_PATH
  ))['particles'].freeze

  def self.noble_capitalize(word)
    in_particle_list?(word) ? word : word.capitalize
  end

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
