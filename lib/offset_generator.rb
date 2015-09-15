class Offset_Generator

  attr_accessor :date_string

  def initialize
  end

  def find_date
    time = Time.new
    date_string = time.strftime("%d%m%y")
  end

  def square_date(string)
    sqr_num = string.to_i ** 2
  end

  def extract_last_4_digits_of_sqr_date(num)
    arr = num.to_s.chars
    offset = arr.last(4).join
  end

end
