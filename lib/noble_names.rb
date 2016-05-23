require 'noble_names/version'
require 'noble_names/config'
require 'noble_names/initializer'
require 'noble_names/data'

# The main Module that has all necessary functions to
# process names.
module NobleNames
  # Capitalizes a word if it needs to be capitalized.
  # @param [String] word the word that needs to be capitalized.
  # @return [String] word the word either capitalized or not.
  def self.noble_capitalize(word)
    prefix = prefix?(word)
    if in_particle_list?(word)
      word.downcase
    elsif prefix
      capitalize(prefix) + capitalize(word.gsub(prefix, ''))
    else
      capitalize(word)
    end
  end

  # Upcases the first small letters in each word,
  # seperated by hyphons.
  # But beware, words seperated by spaces stay small.
  # @return [String] the capitalized word.
  # @example
  #   capitalize('hans-ebert')  #=> 'Hans-Ebert'
  #   capitalize('john')        #=> 'John'
  #   capitalize('john james')  #=> 'John james'
  def self.capitalize(word)
    word.gsub first_small_letters do |letter|
      upcase(letter)
    end
  end

  # Upcases a letter even if it is a german mutated vowel.
  # @return [String] letter the upcased letter.
  # @example
  #   upcase('ä')         #=> 'Ä'
  #   upcase('t')         #=> 'T'
  def self.upcase(letter)
    match = letter.match(/ä|ö|ü/)
    if match
      case match.to_s
      when 'ä' then 'Ä'
      when 'ö' then 'Ö'
      when 'ü' then 'Ü'
      end
    else letter.upcase
    end
  end

  # A Regex literal to find the first letter of a string
  # as well as the first letter after a hyphon.
  # @return [Regexp] first_small_letters the regexp in question
  def self.first_small_letters
    /((\A.|(?<=\-).))/
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
