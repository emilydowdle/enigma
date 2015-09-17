class Offset_Generator

  attr_accessor :date_string

  def initialize
  end

  def create_offset
    date_string = find_date
    sqr_num = square_date(date_string)
    offset_array = extract_last_4_digits_of_sqr_date(sqr_num)
  end

  def find_date
    time = Time.new
    time.strftime("%d%m%y")
  end

  def square_date(string)
    string.to_i ** 2
  end

  def extract_last_4_digits_of_sqr_date(num)
    arr = num.to_s.chars
    arr.last(4)
  end

end
