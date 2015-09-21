gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma_messages'

class TestEnigmaMessages < Minitest::Test

  def test_final_crack_code_key_output
    message = EnigmaWriter.new

    expected_key = "21688"
    key_array = [21, 16, 29, 10]

    assert_equal expected_key, message.final_crack_code_key(key_array)
  end

  def test_create_key_possibilities
    message = EnigmaWriter.new

    input = [21, 16, 29, 10]
    expected = [21, 16, 29, 10, 60, 99, 55, 94]

    assert_equal expected, message.create_key_possibilities(input)
  end

  def test_final_crack_code_key_output_different_array
    message = EnigmaWriter.new

    expected_key = "53482"
    key_array = [14, 34, 9, 4]

    assert_equal expected_key, message.final_crack_code_key(key_array)
  end


end
