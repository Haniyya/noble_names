# Coding: UTF-8
require_relative '../test_helper.rb'

class StringTest < Minitest::Test
  def setup
    NobleNames.configure do |config|
      config.languages = :all
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

  def test_longer_name
    assert_equal 'Hans-Harry Halberstedt-Hallervorden',
      'hans-harry halberstedt-hallervorden'.to_title
  end

  def test_does_not_mess_up_mutated_vowels
    assert_equal 'Rudolf von der Höhe',
      'rudolf von der höhe'.to_title
  end

  def test_capitalizes_mutated_vowels
    assert_equal 'Hans-Harry von Öreböre',
      'hans-harry von öreböre'.to_title
  end

  def test_english_title
    NobleNames.configure do |config|
      config.languages = :english
    end

    assert_equal 'James of Windsor',
      'james of windsor'.to_title
  end

  def test_single_language
    NobleNames.configure do |config|
      config.languages = :french
    end

    assert_equal 'vattier de rideaux'.to_title,
      'Vattier de Rideaux'
    assert_equal 'paul von reinbeck'.to_title,
      'Paul Von Reinbeck'
  end

  def test_prefix_functionality
    assert_equal 'james mcdormer'.to_title,
      'James McDormer'
  end
end
