class CrackCode

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize
  end

  def runner(array)
    final_digits = last_four_of_array(array)
    rotations = find_secret_key(array, final_digits)
    ordered_rotations = rotate_cracked_rotations(rotations, array)
    date_offset = pull_date_offset_from_rotation(date_string)
    key_array = subtract_date_offset_from_rotations(rotations, date_offset)
    secret_key = final_secret_key(key_array)
    # send to decrypt for decryption
  end

  def last_four_of_array(array)
    array[-7..-4]
  end

  def find_secret_key(array, final_digits)
    rotations = []
    counter = 0
    expected_last = [".", ".", "e", "n"]
    final_digits.each do |letter|
      location = CHAR_MAP.index(letter)
      origin = CHAR_MAP.index(expected_last[counter])
      rotations << (location - origin) % CHAR_MAP.length
      counter += 1
    end
    rotations
  end

  def rotate_cracked_rotations(rotations, array)
    num = (array.length - 7) % 4
    rotations.rotate(-num)
  end

  def pull_date_offset_from_rotation(date_string)
    sqr = date_string.to_i ** 2
    arr = sqr.to_s.chars.last(4)
    arr.map {|num| num.to_i}
  end

  def subtract_date_offset_from_rotations(rotation_array, offset_array)
    counter = 0
    key_array = []
    rotation_array.each do |num|
      key_array << num - offset_array[counter]
      counter += 1
    end
    key_array
  end

  def final_secret_key(key_array)
    key = ""
    string = key_array.join
    key << string[0..1]
    key << string[4..5]
    key << string[7]
  end

  # def decrypt_message_without_key(array)
  #   counter = 0
  #   decrypted = []
  #   char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  #   array.each_with_index do |letter, index|
  #     location = char_map.index(letter)
  #     decrypted << char_map[(location - rotations[counter]) % char_map.length]
  #     counter = (counter + 1) % rotations.length
  #   end
  #   decrypted.join
  # end

  # def find_rotation_order(array)
  #   last_letter_rotation = string.length - 7 % 4
  ## first period in the ..end.. will be the next order
  # end

  #rotate array


end
