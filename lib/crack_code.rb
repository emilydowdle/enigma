class Crack_Code

  def initialize
  end

  def runner(array)
    final_digits = last_four_of_array(array)


    rotation = rotate_cracked_rotations
  end

  def last_four_of_array(array)
    array[-7..-4]
  end

  def find_secret_key(array, final_digits)
    rotations = []
    char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

    array.each_with_index do |letter, index|
      location = char_map.index(letter) # this is the rotated position
      origin = char_map.index(final_digits[counter])
  end

  def rotate_cracked_rotations(rotations, array)
    num = (array.length - 7) % 4
    rotations.rotate(num)
  end

  def decrypt_message_without_key(array)
    counter = 0
    decrypted = []
    char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    array.each_with_index do |letter, index|
      location = char_map.index(letter)
      decrypted << char_map[(location - rotations[counter]) % char_map.length]
      counter = (counter + 1) % rotations.length
    end
    decrypted.join
  end

  # def find_rotation_order(array)
  #   last_letter_rotation = string.length - 7 % 4
  ## first period in the ..end.. will be the next order
  # end

  #rotate array

  rotations


end
