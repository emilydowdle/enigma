gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/rotator'

class TestRotator < Minitest::Test

  def test_code_has_5_digits
    skip
    code = Rotator.new
    assert_equal 5, code.key.length
  end

  def test_2_codes_are_not_same
    skip
    code = Rotator.new

    assert first_code != second_code
  end

end
