require_relative '../test_helper.rb'

class StringTest < Minitest::Test
  def setup
    NobleNames.configure do |config|
      config.languages = [:german]
    end
  end

  def test_string_has_to_title
    assert "string".respond_to?(:to_title)
  end

  def test_string_includes_core_ext
    assert String.included_modules.include?(NobleNames::CoreExt::String)
  end

  def test_german_normal_name
    assert_equal "paul martensen",
      "Paul Martensen".to_title
  end

  def test_german_noble_name
    assert_equal "paul von bramstedt",
      "Paul von Bramstedt".to_title
  end
end
