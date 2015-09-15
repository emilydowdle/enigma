class Rotator

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  attr_accessor :key_array,
                :offset_array

  def initialize(key_array, offset_array)
    @key_array = key_array
    @offset_array = offset_array
  end

  def map_runner
    find_an_offset
    create_a_map(a_offset)
  end

  def find_a_offset
    key_offset = "#{key_array[0]}#{key_array[1]}".to_i
    offset = "#{offset_array[0]}".to_i
    a_offset = key_offset + offset
  end

  def create_a_map(offset)
    slide = offset % CHAR_MAP.length
    temp = []
    leftovers = []
    final_map = []
    CHAR_MAP.each_with_index do |letter, index|
      temp << CHAR_MAP[index + slide]
      if !temp.include? letter
        leftovers << letter
      end
      temp.delete(nil)
      final_map = temp + leftovers
    end
    final_map
  end

end

# START

# create array for each rotation map
#   - use remainder to slide letters within each map array
#   - return each map and set a variable
#
# END
