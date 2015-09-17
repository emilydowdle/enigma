class Decrypt

  def initialize
  end

  def decrypt_message(array, rotations)
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

end
