module NobleNames
  module CoreExt
    module String
      # Capitalizes each Word in a name
      # except for those which are nobility particles
      #   'jamie jones'.to_title      # => 'Jamie Jones'
      #   'jamie of windsor'.to_title # => 'Jamie of Windsor'
      def to_title
        dup.to_title!
      end

      def to_title!
        words = split(/\s+/)
        words.map! { |w| NobleNames.noble_capitalize(w) }
        replace(words * ' ')
      end
    end
  end
end
