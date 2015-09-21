gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryption_machine'

class TestEncrypt < Minitest::Test
  def test_encrypt_string
    code = Encrypt.new
    string = ["h", "e"]
    rotations = [1, 2, 3, 4]
    assert_equal ["i", "g"], code.encrypt_message(string, rotations).chars
  end

  def test_encrypt_string_longer_than_rotations
    code = Encrypt.new
    string = ["h", "e", "l", "l", "o"]
    rotations = [1, 2, 3, 4]
    assert_equal ["i", "g", "o", "p", "p"], code.encrypt_message(string, rotations).chars
  end

  def test_decrypt_string_with_high_rotations
    code = Encrypt.new
    string = ["a", "e", "l", "l", ","]
    rotations = [91, 76, 85, 28]
    assert_equal "ncsam", code.encrypt_message(string, rotations)
  end

  def test_encrypt_string_with_letter_at_end_of_alphabet
    code = Encrypt.new
    string = ["h", "e", "l", "l", ","]
    rotations = [1, 2, 3, 4]
    assert_equal ["i", "g", "o", "p", "a"], code.encrypt_message(string, rotations).chars
  end

  def test_encrypt_will_print_character_if_not_in_char_map
    code = Encrypt.new
    string = ["h", "e", "l", "l", "$"]
    rotations = [1, 2, 3, 4]

    assert_equal "igop$", code.encrypt_message(string, rotations)
  end

  def test_encrypt_prints_unknown_characters
    code = Encrypt.new
    string = ["f", "c", "o", "l", "!", "@", " ", "a"]
    rotations = [1, 2, 3, 4]

    assert_equal "gerp!@.c", code.encrypt_message(string, rotations)
  end

  def test_encrypt_prints_more_unknown_characters
    code = Encrypt.new
    string = ["f", "c", "o", "l", "!", "@", " ", "a"]
    rotations = [20, 25, 95, 6]

    assert_equal "z15r!@rz", code.encrypt_message(string, rotations)
  end

  def test_encrypt_prints_unknown_characters_in_different_rotations
    code = Encrypt.new
    string = ["f", "c", "o", "l", "!", "@", " ", "a"]
    rotations = [20, 105, 350, 6]

    assert_equal "z3nr!@r1", code.encrypt_message(string, rotations)
  end

end
