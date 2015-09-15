gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/rotator'

class TestRotator < Minitest::Test

  def test_offset_a
    code = Rotator.new(["3", "4", "5", "6", "7"], ["6", "9", "1", "2"])
    assert_equal 40, code.find_a_offset
  end

  def test_2_codes_are_not_same
    code = Rotator.new(["9", "0", "5", "6", "7"], ["1", "5", "1", "2"])
    assert_equal 91, code.find_a_offset
  end

  def test_create_a_map
    code = Rotator.new(["9", "0", "5", "6", "7"], ["1", "5", "1", "2"])
    assert_equal "g", code.create_a_map(45)[0]
  end

  def test_create_map_different_slide
    code = Rotator.new(["9", "0", "5", "6", "7"], ["1", "5", "1", "2"])
    assert_equal "1", code.create_a_map(105)[0]
  end




end
