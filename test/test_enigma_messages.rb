gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma_messages'

class TestEnigmaMessages < Minitest::Test

  def test_add_39
    message = EnigmaWriter.new

    expected_key = "21685"
    key_array = [21, 16, 29, 7]
    expected_array = [21, 16, 68, 85]

    assert_equal "", message.find_if_nums_match(key_array)
  end

  def test_is_correct_key_array
    message = EnigmaWriter.new
    expected_array = [21, 16, 68, 85]

    assert_equal false, message.is_correct_key_array(key_array)
  end

end
