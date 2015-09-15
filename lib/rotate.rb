require_relative '../lib/map_a_rotation'


class Map_Offsets

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  attr_accessor :key_array

  def initialize(string)
    @string = string
  end

  def encrypt
    string_to_array
    a_map
    # b_offset
    # c_offset
    # d_offset
  end

  def string_to_array
    @key_array = @string.chars
  end

  def a_map
    rot_a = "#{@key_array[0]}#{@key_array[1]}".to_i
    a_offset = rot_a % CHAR_MAP.length
    encrypt = Map_A_Rotation.new(a_offset)
    encrypt.create_map
  end

  def determine_offsets(rot_a, rot_b, rot_c, rot_d)

  end

  # rot_b = "#{key_array[1]}#{key_array[2]}".to_i
  # rot_c = "#{key_array[2]}#{key_array[3]}".to_i
  # rot_d = "#{key_array[3]}#{key_array[4]}".to_i
  # b_offset = rot_b % CHAR_MAP.length
  # c_offset = rot_c % CHAR_MAP.length
  # d_offset = rot_d % CHAR_MAP.length
end

enigma = Map_Offsets.new("69965")
enigma.encrypt
