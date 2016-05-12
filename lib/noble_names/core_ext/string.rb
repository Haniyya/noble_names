module NobleNames
  module CoreExt
    module String

      # Capitalizes each Word in a name
      # except for those which are nobility particles
      #   'jamie jones'.to_title      # => 'Jamie Jones'
      #   'jamie of windsor'.to_title # => 'Jamie of Windsor'
      def to_title
        self.dup.to_title!
      end

      def to_title!
        words = self.split(/\W+/)
        words.map! do |w|
          noble_capitalize(w)
        end
        self.replace(words * ' ')
      end

      private
      def noble_capitalize(word)
        in_particle_list?(word) ? word : word.capitalize
      end

      def in_particle_list?(word)
        particles = PARTICLES
          .select { |lang| NobleNames.configuration.languages.include?(lang.to_sym) }
          .values.flatten
        particles.include? word
      end
    end
  end
end
