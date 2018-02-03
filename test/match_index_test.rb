
require_relative 'test_helper.rb'

class MatchIndexTest < Minitest::Test
  def setup
    @mi = NobleNames::MatchIndex.new('nobility_particles.yml')
    @mip = NobleNames::MatchIndex.new('nobility_prefixes.yml')
  end

  def test_prefix_method
    assert_equal 'mc',
      @mip.prefix?('mcdormer')
  end

  def test_has_loaded_particles
    assert @mi.in_particle_list? 'von'
  end

  def test_data_type
    assert @mi.data.is_a? Hash
  end

  def test_data_content
    assert @mi.data.key? 'german'
  end
end
