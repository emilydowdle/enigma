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

end
