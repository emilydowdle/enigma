gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class TestEncrypt < Minitest::Test
  def test_encrypt_string
    code = Encrypt.new
    string = ["h", "e"]
    rotations = [1, 2, 3, 4]
    assert_equal ["i", "g"], code.encrypt_message(string, rotations)
  end

  def test_encrypt_string_longer_than_rotations
    code = Encrypt.new
    string = ["h", "e", "l", "l", "o"]
    rotations = [1, 2, 3, 4]
    assert_equal ["i", "g", "o", "p", "p"], code.encrypt_message(string, rotations)
  end

  def test_encrypt_string_with_letter_at_end_of_alphabet
    code = Encrypt.new
    string = ["h", "e", "l", "l", ","]
    rotations = [1, 2, 3, 4]
    assert_equal ["i", "g", "o", "p", "a"], code.encrypt_message(string, rotations)
  end
  # character in the string isn't in the char_map
end
