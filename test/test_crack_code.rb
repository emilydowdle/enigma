gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack_code'

class TestCrackCode < Minitest::Test
  def test_find_last_four
    code = Crack_Code.new
    array = ["g", "o", "o", "d", "b", "y", "e", ".", ".", "e", "n", "d", ".", "."]

    assert_equal [".", ".", "e", "n"], code.last_four_of_array(array)
  end

  def test_find_final_secret_key
    code = Crack_Code.new
    array = ["g", "o", "o", "d", "b", "y", "e", ".", ".", "e", "n", "d", ".", "."]
    final_digits = ["o", "o", "k", "m"]

    assert_equal [16, 16, 6, 38], code.find_secret_key(array, final_digits)
  end
  #
  def test_find_secret_key_from_different_array
    code = Crack_Code.new
    array = ["g", "o", "o", "d", "b", "y", "e", ".", ".", "e", "n", "d", ".", "."]
    final_digits = ["t", "t", "m", "u"]

    assert_equal [21, 21, 8, 7], code.find_secret_key(array, final_digits)
  end

  def test_rotate_cracked_rotations
    code = Crack_Code.new
    array = ["g", "o", "o", "d", "b", "y", "e", ".", ".", "e", "n", "d", ".", "."]
    rotations = [21, 21, 8, 7]

    assert_equal [21, 8, 7, 21], code.rotate_cracked_rotations(rotations, array)
  end

  def test_rotate_cracked_rotations_different_array
    code = Crack_Code.new
    array = ["g", "d", "b", "y", "e", ".", ".", "e", "n", "d", ".", "."]
    rotations = [21, 21, 8, 7]

    assert_equal [7, 21, 21, 8], code.rotate_cracked_rotations(rotations, array)
  end

  def test_pull_date_offset
    code = Crack_Code.new
    rotations = [21, 21, 8, 7]

    assert_equal [7, 2, 2, 5], code.pull_date_offset_from_rotation("170915")
  end

  def test_subtract_date_offset
    code = Crack_Code.new
    rotations = [34, 17, 52, 26]
    offset = [7, 2, 2, 5]

    assert_equal [27, 15, 50, 21], code.subtract_date_offset_from_rotations(rotations, offset)
  end

  def test_find_key
    code = Crack_Code.new
    key_array = [27, 15, 50, 21]

    assert_equal [14, 19, 6, 2], code.final_secret_key(key_array)
  end

end
