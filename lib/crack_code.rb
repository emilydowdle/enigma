require_relative 'enigma'
require_relative 'enigma_messages'
require 'pry'

class CrackCode

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize
  end

  def crack_runner(input, output, date)
    encrypted_message_string = read_message_to_encrypt(input)
    temp_message_array = create_message_array(encrypted_message_string)
    ordered_rotations = decrypt_rotational_array(temp_message_array)
    cracked_message = decrypt_message_without_key(temp_message_array, ordered_rotations)
    date_offset = pull_date_offset_from_rotation(date)
    key_array = subtract_date_offset_from_rotations(ordered_rotations, date_offset)
      # secret_key = EnigmaWriter.new.final_secret_key(key_array)
      # printout = EnigmaWriter.new.crack_print(output, secret_key)
    write_encrypted_message_to_file(cracked_message, output)
  end

  def decrypt_rotational_array(temp_message_array)
    final_digits = last_four_of_array(temp_message_array)
    rotations = find_secret_key(temp_message_array, final_digits)
    rotate_cracked_rotations(rotations, temp_message_array)
  end

  def read_message_to_encrypt(input)
    encrypted_message = Enigma.new
    encrypted_message.read_file(input)
  end

  def write_encrypted_message_to_file(cracked_message, output)
    final_output = Enigma.new
    final_output.write_file(cracked_message, output)
  end

  def create_message_array(string)
    string.chars
  end

  def last_four_of_array(array)
    array[-8..-5]

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
    num = (array.length) % 4
    rotations.rotate!(num)
  end

  def pull_date_offset_from_rotation(date_string)
    sqr = date_string.to_i ** 2
    arr = sqr.to_s.chars.last(4)
    arr.map {|num| num.to_i}
  end

  def decrypt_message_without_key(array, ordered_rotations)
    counter = 0
    decrypted = []
    array.each_with_index do |letter, index|
      if !CHAR_MAP.include? letter
        decrypted << letter
      else
        location = CHAR_MAP.index(letter)
        decrypted << CHAR_MAP[(location - ordered_rotations[counter]) % CHAR_MAP.length]
        counter = (counter + 1) % ordered_rotations.length
      end
    end
    decrypted.join
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

end
