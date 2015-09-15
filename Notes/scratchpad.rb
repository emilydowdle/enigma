# class for key generation

# class for date format and adding to key generation (offset)

# class for encryption

# class for decryption

# class for key cracking




  class Rotate

    CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

    attr_accessor

    def initialize(key_string)
      @key_string = key_string
    end

    def encrypt
      key_array = @key_string.chars
      rotation_output(key_array)
      slide(rot_a, rot_b, rot_c, rot_d)
      create_encryption_maps(a_slide, b_slide, c_slide, d_slide)
    end

    def rotation_output(key_array)
      rot_a = "#{key_array[0]}#{key_array[1]}".to_i
      rot_b = "#{key_array[1]}#{key_array[2]}".to_i
      rot_c = "#{key_array[2]}#{key_array[3]}".to_i
      rot_d = "#{key_array[3]}#{key_array[4]}".to_i
    ends

    def slide(rot_a, rot_b, rot_c, rot_d)
      a_slide = rot_a % CHAR_MAP.length
      b_slide = rot_b % CHAR_MAP.length
      c_slide = rot_c % CHAR_MAP.length
      d_slide = rot_d % CHAR_MAP.length
    end

    def create_encryption_maps(a_slide, b_slide, c_slide, d_slide)
      a_encryption_prep(a_slide)
      # b_encryption_prep(b_slide)
      # c_encryption_prep(c_slide)
      # d_encryption_prep(d_slide)

    end
    #
    # def a_encryption_prep(a_slide)
    #   a_char_map = []
    #   leftovers = []
    #   temp = []
    #
    #   a_encryption_map(a_slide, a_char_map, leftovers, temp)
    # end
    #
    # def a_encryption_map(a_slide, a_char_map, leftovers, temp)
    #   CHAR_MAP.each_with_index do |letter, index|
    #     temp << CHAR_MAP[index + a_slide]
    #     if !temp.include? letter
    #       leftovers << letter
    #     end
    #     temp.delete(nil)
    #     a_char_map = temp + leftovers
    #   end
    #   puts a_char_map
    #
    # end

  end
