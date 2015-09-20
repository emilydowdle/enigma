gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma_messages'

class TestEnigmaMessages < Minitest::Test

  def test_add_39
    message = EnigmaWriter.new

    key = "21685"
    key_array = [21, 16, 29, 7]

    assert_equal "key", message.find_if_nums_match(key_array)
  end

end
