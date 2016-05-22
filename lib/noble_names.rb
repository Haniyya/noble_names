require 'noble_names/version'
require 'noble_names/config'
require 'noble_names/initializer'
require 'noble_names/data'
require 'yaml'

# {include:file:README.md}
module NobleNames
  extend Forwardable

  SUPPORTED_LANGUAGES =
    [:german, :english, :french, :spanish, :portuguese].freeze

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
    Data.particles.include? word
  end

  def self.prefix?(word)
    Data.prefixes.each do |pre|
      return pre if (word =~ Regex(pre)) == 0
    end
    return nil
  end

  # Applies the core extension
  initialize
end
