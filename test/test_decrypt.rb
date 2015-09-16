gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'

class TestEncrypt < Minitest::Test
  def test_decrypt_string
    code = Decrypt.new
    string = ["h", "e"]
    rotations = [1, 2, 3, 4]
    assert_equal "gc", code.decrypt_message(string, rotations)
  end

  def test_decrypt_string_longer_than_rotations
    code = Decrypt.new
    string = ["h", "e", "l", "l", "o"]
    rotations = [1, 2, 3, 4]
    assert_equal "gcihn", code.decrypt_message(string, rotations)
  end

  def test_decrypt_string_with_letter_at_end_of_alphabet
    code = Decrypt.new
    string = ["h", "e", "l", "l", ","]
    rotations = [1, 2, 3, 4]
    assert_equal "gcih.", code.decrypt_message(string, rotations)
  end

  def test_decrypt_string_with_letter_at_front_of_alphabet
    code = Decrypt.new
    string = ["a", "e", "l", "l", ","]
    rotations = [1, 2, 3, 4]
    assert_equal ",cih.", code.decrypt_message(string, rotations)
  end
  # character in the string isn't in the char_map
end
