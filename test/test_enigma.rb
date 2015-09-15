gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/rotator'
require_relative '../lib/map_a_rotation'

class TestRotator < Minitest::Test

  def test_initialize
    code = Rotator.new("34567")



    assert_equal "", output
  end


end
