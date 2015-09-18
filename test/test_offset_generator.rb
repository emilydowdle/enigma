require_relative '../lib/key_generator'

class TestOffsetGenerator < Minitest::Test

  def test_date_string_format_length
    time = OffsetGenerator.new
    assert_equal 6, time.find_date.length
  end

  def test_date_string_year
    time = OffsetGenerator.new
    assert_equal true, time.find_date.end_with?("15")
  end

  def test_square_date
    time = OffsetGenerator.new
    output = time.square_date("150915")
    assert_equal true, output == 150915 ** 2
  end

  def test_extract_last_four_length
    time = OffsetGenerator.new
    output = time.extract_last_4_digits_of_sqr_date(150915 ** 2)
    assert_equal 4, output.length
  end

  def test_extract_last_four
    time = OffsetGenerator.new
    output = time.extract_last_4_digits_of_sqr_date(150915 ** 2)
    assert_equal "7225", output
  end

end
