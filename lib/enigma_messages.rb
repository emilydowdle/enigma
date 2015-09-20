require 'pry'

class EnigmaWriter

  def initialize
  end

  def encrypt_print(output, key_array)
    puts "Created #{output} with the key #{self.final_secret_key(key_array)} and date #{Time.new.strftime("%d%m%y")}"
  end

  def find_if_nums_match(key_array)
    correct = []
    counter = 0
    key_array.each do |num|
      if key_array.join.chars[counter + 1] == key_array.join.chars[counter + 2]
        num
      else
        num += 39
      end
      counter += 2
      binding.pry
    end
  end


  #
  # def add_39_until_it_matches(key_array)
  #   adjusted = key_array.map do |num|
  #     if num < 39
  #       num
  #     else
  #       num = num + 39
  #     end
  #   end
  #   adjusted
  # end

  def final_secret_key(key_array)
    output = []

    key = key_array.join.chars
    key.map.with_index do |num, index|
      binding.pry
      if index == 0 || index % 2 != 0
        output << num
      end
      # binding.pry
    end
    output.join
  end

  def crack_print(output, secret_key)
    puts "Created #{output} with the key #{secret_key} and date #{Time.new.strftime("%d%m%y")}"
  end

end
