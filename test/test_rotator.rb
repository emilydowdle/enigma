gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/rotator'

class TestRotator < Minitest::Test

  def test_create_a_map
    code = Rotator.new(["9", "0", "5", "6", "7"], ["1", "5", "1", "2"])
    assert_equal "g", code.create_map(45)[0]
  end

  def test_create_map_different_slide
    code = Rotator.new(["9", "0", "5", "6", "7"], ["1", "5", "1", "2"])
    assert_equal "1", code.create_map(105)[0]
  end

end
