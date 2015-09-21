require_relative 'enigma'
require_relative 'key_generator'
require_relative 'offset_generator'
require_relative 'enigma_messages'

class Decrypt

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize
  end

  def decrypt_runner(input, output, key, date)
    encrypted_message_string = read_message_to_decrypt(input)
    temp_message_array = create_message_array(encrypted_message_string)
    key_array = find_key_array(key)
    rotations = create_rotational_array(key_array, date)
    decrypted_message = decrypt_message(temp_message_array, rotations)
    write_decrypted_message_to_file(decrypted_message, output, key_array, date)
  end

  def read_message_to_decrypt(input)
    encrypted_message = Enigma.new
    encrypted_message.read_file(input)
  end

  def write_decrypted_message_to_file(decrypted_message, output, key_array, date)
    final_output = Enigma.new
    final_output.write_file(decrypted_message, output)
    EnigmaWriter.new.decrypt_print(output, key_array, date)
  end

  def create_message_array(string)
    string.chars
  end

  def find_key_array(key_string)
    key = KeyGenerator.new
    key.create_key_array(key_string)
  end

  def create_rotational_array(key_array, date)
    offset_array = find_offset_array(date)
    add_secret_key_and_offset(key_array, offset_array)
  end

  def find_offset_array(date_string)
    offset = OffsetGenerator.new
    offset.inherit_offset(date_string)
  end

  def add_secret_key_and_offset(key_array, offset_array)
    rotations = []
    counter = 0
    key_array.each do |num|
      rotations << num + offset_array[counter]
      counter += 1
    end
    rotations
  end

  def decrypt_message(array, rotations)
    counter = 0
    decrypted = []
    array.each_with_index do |letter, index|
      if !CHAR_MAP.include? letter
        decrypted << letter
      else
        location = CHAR_MAP.index(letter)
        decrypted << CHAR_MAP[(location - rotations[counter]) % CHAR_MAP.length]
        counter = (counter + 1) % rotations.length
      end
    end
    decrypted.join
  end

end
