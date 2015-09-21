require 'pry'

class KeyGenerator

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize
  end

  def create_key
    key = random_generator
    key_array = create_key_array(key)
  end

  def random_generator
    key = []
    5.times do
      key << rand(1..9)
    end
    key
  end

  def create_key_array(key)
    if key.class == String
      key = key.chars
    end
    counter = 0
    key_array = []
    key.each_with_index do |num, index|
      key_array << "#{key[counter]}#{key[counter + 1]}".to_i
      counter += 1
    end
    key_array[0..-2]
  end

end
