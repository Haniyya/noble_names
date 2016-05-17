require_relative 'core_ext/string.rb'

module NobleNames
  # This is wrapped in a method so it isn't immediatly
  # evaluated when its loaded
  def self.initialize
    String.class_eval do
      include NobleNames::CoreExt::String
    end
  end
end
