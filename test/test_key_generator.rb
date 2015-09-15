require_relative '../lib/key_generator'

class TestKeyGenerator < Minitest::Test

  def test_code_has_5_digits
    code = Key_Generator.new
    assert_equal 5, code.key.length
  end

  def test_2_codes_are_not_same
    code = Key_Generator.new
    code1 = Key_Generator.new
    first_code = code.key
    second_code = code1.key
    assert first_code != second_code
  end

end
