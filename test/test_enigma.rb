gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/rotate'


class TestEnigma < Minitest::Test

  def test_initialize
    code = Rotate.new("34567")
    assert code
  end

  def test_key_string_to_array
    code = Rotate.new("34567")

    assert_equal ["3","4","5","6","7"], code.encrypt
  end

  # def test_rotation_output
  #   code = Rotate.new("34567")
  #   code.encrypt
  #   code.rotation_output
  #   assert_equal "",
  #
  # end

end
