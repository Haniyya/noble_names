require_relative '../test_helper.rb'

class StringTest < Minitest::Test
  def setup
    NobleNames.configure do |config|
      config.languages = [:german]
    end
  end

  def test_string_has_to_title
    assert 'string'.respond_to?(:to_title)
  end

  def test_string_includes_core_ext
    assert String.included_modules.include?(NobleNames::CoreExt::String)
  end

  def test_german_normal_name
    assert_equal 'Paul Martensen',
                 'paul martensen'.to_title
  end

  def test_german_noble_name
    assert_equal 'Paul von Bramstedt',
                 'paul von bramstedt'.to_title
  end

  def test_more_complex_german_name
    assert_equal 'Paul von und zu Hoffenstadt der Vierte',
                 'paul von und zu hoffenstadt der vierte'.to_title
  end

  def test_replacer_method
    string = 'paul von kiel'
    string.to_title!
    assert_equal 'Paul von Kiel',
                 string
  end

  def test_english_title
    NobleNames.configure do |config|
      config.languages = :english
    end

    assert_equal 'James of Windsor',
                 'james of windsor'.to_title
  end
end
