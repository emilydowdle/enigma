gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decryption_machine'

class TestDecrypt < Minitest::Test

  def test_decrypt_string
    code = Decrypt.new

    string = ["h", "e"]
    rotations = [1, 2, 3, 4]

    assert_equal "gc", code.decrypt_message(string, rotations)
  end

  def test_decrypt_string_as_long_as_rotations
    code = Decrypt.new

    string = ["h", "e", "l", "p"]
    rotations = [1, 2, 3, 4]

    assert_equal "gcil", code.decrypt_message(string, rotations)
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

  def test_decrypt_string_with_high_rotations
    code = Decrypt.new
    string = ["a", "e", "l", "l", ","]
    rotations = [91, 76, 85, 28]
    assert_equal "0gewz", code.decrypt_message(string, rotations)
  end

  def test_encrypt_prints_unknown_characters
    code = Decrypt.new
    string = ["f", "c", "o", "l", "!", "@", " ", "a"]
    rotations = [1, 2, 3, 4]

    assert_equal "ealh!@9.", code.decrypt_message(string, rotations)
  end

  def test_decrypt_prints_more_unknown_characters
    code = Decrypt.new
    string = ["f", "c", "o", "l", "!", "@", " ", "a"]
    rotations = [20, 25, 95, 6]

    assert_equal "yq f!@qo", code.decrypt_message(string, rotations)
  end

  def test_decrypt_prints_unknown_characters_in_different_rotations
    code = Decrypt.new
    string = ["f", "c", "o", "l", "!", "@", " ", "a"]
    rotations = [1, 2, 3, 4]

    assert_equal "ealh!@9.", code.decrypt_message(string, rotations)
  end
end
