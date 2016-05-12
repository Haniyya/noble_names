require_relative 'core_ext/string.rb'

String.class_eval do
  include NobleNames::CoreExt::String
end
