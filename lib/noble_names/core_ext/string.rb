
module NobleNames
  module CoreExt
    # This Module gives {String} the capability to
    # titleize itself.
    module String
      # Capitalizes each Word in a name
      # except for those which are nobility particles
      # @return [String] name a new String matching the old `self`
      #   titleized.
      # @example Titleize names
      #   'jamie jones'.to_title      # => 'Jamie Jones'
      #   'jamie of windsor'.to_title # => 'Jamie of Windsor'
      def to_title
        dup.to_title!
      end

      # Does the same as {String#to_title} but replaces the old string.
      # @example Titleize a name
      #   str = 'jamie of windsor'
      #   str.to_title!
      #   str                     #=> 'Jamie of Windsor'
      def to_title!
        words = split(/\s+/)
        if words.any? { |w| NobleNames.business_particle? w }
          NobleNames.correct_business_particles words
        else
          words.map! { |w| NobleNames.noble_capitalize(w) }
        end
        replace(words * ' ')
      end
    end
  end
end
