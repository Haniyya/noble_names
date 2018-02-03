
require 'yaml'

module NobleNames
  # A {MatchIndex} holds the data necessary for finding
  # prefixes and particles in Strings and checks them for it.
  # {MatchIndex}s use Hashes for finding particles to guarantee
  # constant performance in big particle lists.
  # A {MatchIndex} has a lot of mutable state to cache as much matching
  # information as possible.
  class MatchIndex
    attr_accessor :data

    # Takes either a String or any Object and tries to
    # convert it to a hash.
    # @return [MatchIndex] match_index a new {MatchIndex}
    # @param [String, Object] list if this is a string, it will
    #   be treated as a file-name in the `data/` folder from
    #   which a Hash will be extracted, containing
    #   language-keys and data.
    # @example A correct data list
    #   MatchIndex.new({
    #     'german' => ['von', 'zu'],
    #     'english' => ['of']
    #   })
    def initialize(list)
      case list
      when String
        @data = YAML.load_file(File.expand_path(list, Data::DATA_PATH))
        @data = @data.values.first
      else
        @data = Hash[list]
      end
      @lanugages = NobleNames.configuration.languages
    end

    # Returns and caches the particles of a MatchIndex.
    # @return [Hash] particles A Hash containing particles to
    #   match against.
    # @example A particle hash
    #   MatchIndex.new('nobility_particles.yml')
    #     .particles.has_key?('von')                 #=> true
    #   MatchIndex.new('nobility_particles.yml')
    #     .particles['von']                          #=> 'von'
    def particles
      @particles ||= Hash[selected_data.collect { |v| [v.downcase, v] }]
    end

    # Checks weither a word is in the nobility particle list.
    # @param [String] word the word that is checked.
    # @return [Boolean] `true` if `word` is in the particle_list,
    #   `false` otherwise.
    def in_particle_list?(word)
      reindex if languages != NobleNames.configuration.languages
      particles.key? word
    end

    # Caches the particles or prefixes by the languages selected
    # in the config.
    # @return [Array] selected_data The data filtered by
    #   used languages.
    def selected_data
      @selected_data ||=
        data
        .select { |l| languages.include? l.to_sym }
        .values
        .flatten
    end

    # Checks weither a word has a prefix as defined in
    # the MatchIndexs data and returns it.
    # @param [String] word the word that needs to be checked.
    # @return [String] pre the Prefix of the word. `nil` if
    #   it has none.
    # @example
    #   prefix?('mcdormer')           #=> 'mc'
    def prefix?(word)
      reindex if languages != NobleNames.configuration.languages
      prefixes.each do |pre|
        return pre unless (word =~ Regexp.new('^' + pre.to_s)).nil?
      end
      nil
    end

    alias prefixes selected_data

    # Resets the state of the MatchIndex
    def reindex
      self.languages     = NobleNames.configuration.languages
      self.selected_data = nil
      self.prefixes      = nil
      self.particles     = nil
    end

    private

    attr_accessor :languages
    attr_writer :particles, :prefixes, :selected_data
  end
end
