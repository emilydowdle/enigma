require_relative 'enigma'
require_relative 'key_generator'
require_relative 'offset_generator'
require_relative 'enigma_messages'

class Decrypt

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize
  end

  def decrypt_runner(input, output, key, date)
    encrypted_message = Enigma.new
    encrypted_message_string = encrypted_message.read_file(input)
    temp_message_array = create_message_array(encrypted_message_string)

    key_array = find_key_array(key)
    puts "Created #{output} with the key #{key} and date #{date}"
    offset_array = find_offset_array(date)
    rotations =  add_secret_key_and_offset(key_array, offset_array)

    decrypted_message = decrypt_message(temp_message_array, rotations)
    final_output = Enigma.new
    final_output.write_file(decrypted_message, output)
  end

  def create_message_array(string)
    string.chars
  end

  def find_key_array(key_string)
    key = KeyGenerator.new
    key.create_key_array(key_string)
  end

  def find_offset_array(date_string)
    offset = OffsetGenerator.new
    offset.inherit_offset(date_string)
    # require 'pry'; binding.pry

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

input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]

message = Decrypt.new
message.decrypt_runner(input, output, key, date)
