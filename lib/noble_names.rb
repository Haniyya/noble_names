
require 'noble_names/match_index'
require 'noble_names/version'
require 'noble_names/config'
require 'noble_names/initializer'
require 'noble_names/data'

# The main Module that has all necessary functions to
# process names.
module NobleNames
  # Records whether String#upcase supports UTF-8 characters.
  STANDARD_UPACE_SUPPORT = (RUBY_VERSION.to_f >= 2.4)

  class << self
    # Capitalizes a word if it needs to be capitalized.
    # @param [String] word the word that needs to be capitalized.
    # @return [String] word the word either capitalized or not.
    def noble_capitalize(word)
      prefix = Data.nobility_prefixes.prefix?(word)
      if Data.nobility_particles.in_particle_list?(word)
        word.downcase
      elsif prefix
        capitalize(prefix) + capitalize(word.gsub(prefix, ''))
      else
        capitalize(word)
      end
    end

    # Upcases the first small letters in each word,
    # seperated by hyphons.
    # The word is also not capitalized if it already contains
    # a capitalized letter. This is to allow Business Names
    # to have custom capitalization.
    # But beware, words seperated by spaces stay small.
    # @return [String] the capitalized word.
    # @example
    #   capitalize('hans-ebert')  #=> 'Hans-Ebert'
    #   capitalize('john')        #=> 'John'
    #   capitalize('john james')  #=> 'John james'
    #   capitalize('eBase')       #=> 'eBase'
    def capitalize(word)
      if word =~ /[A-Z]|Ä|Ö|Ü/
        word
      else
        word.gsub first_small_letters do |letter|
          upcase(letter)
        end
      end
    end

    # Checks weither a word is in the business particle list
    # @param [String] word The word in question.
    # @return [Boolean] result `true` if `word` is a business-particle
    #   `false` otherwise
    def business_particle?(word)
      Data.business_particles.in_particle_list? word
    end

    # Corrects only the business particle and leaves the
    # other words alone.
    # @param [Array] words An array of words to be checked.
    # @return [Array] words An array of corrected words.
    # @example A Business Name
    #   correct_business_particles([
    #     'cool', 'and', 'hip', 'gmbh'
    #   ])                    #=> ['cool', 'and', 'hip', 'GmbH']
    def correct_business_particles(words)
      words.map! do |word|
        if business_particle?(word)
          word
            .replace(Data.business_particles.particles[word.downcase])
        else
          noble_capitalize(word)
        end
      end
    end

    private

    # Upcases a letter even if it is a german mutated vowel.
    # @return [String] letter the upcased letter.
    # @example
    #   upcase('t')         #=> 'T'
    def upcase(letter)
      return letter.upcase if STANDARD_UPACE_SUPPORT
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
    def first_small_letters
      /((\A.|(?<=\-).))/
    end
  end

  # Applies the core extension
  initialize
end
