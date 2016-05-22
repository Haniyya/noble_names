require 'noble_names/version'
require 'noble_names/config'
require 'noble_names/initializer'
require 'noble_names/data'

# {include:file:README.md}
module NobleNames
  # Capitalizes a word if it needs to be capitalized.
  # @param [String] word the word that needs to be capitalized.
  # @param [String] word the word either capitalized or not.
  def self.noble_capitalize(word)
    prefix = prefix?(word)
    if in_particle_list?(word)
      word
    elsif prefix
      prefix.capitalize + word.gsub(prefix, '').capitalize
    else
      word.capitalize
    end
  end

  # Checks weither a word is in the nobility particle list.
  # @param [String] word the word that is checked.
  # @return [Boolean] `true` if `word` is in the particle_list,
  #   `false` otherwise.
  def self.in_particle_list?(word)
    Data.particles.include? word
  end

  # Checks weither a word has a prefix as defined in
  # `data/prefixes.yml` and returns it.
  # @param [String] word the word that needs to be checked.
  # @return [String] pre the Prefix of the word. `nil` if
  #   it has none.
  # @example
  #   prefix?('james mcdormer')           #=> 'mc'
  def self.prefix?(word)
    Data.prefixes.each do |pre|
      return pre if (word =~ Regexp.new(pre)) == 0
    end
    nil
  end

  # Applies the core extension
  initialize
end
