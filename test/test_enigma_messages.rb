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

end
