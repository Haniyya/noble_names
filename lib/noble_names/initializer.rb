# frozen_string_literal: true

require_relative 'core_ext/string'

# :nodoc:
module NobleNames
  # This is wrapped in a method so it isn't immediatly
  # evaluated when its loaded
  def self.initialize
    String.class_eval do
      include NobleNames::CoreExt::String
    end
  end
end
