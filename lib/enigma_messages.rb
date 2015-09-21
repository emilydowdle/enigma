require 'pry'

class EnigmaWriter

  def initialize
  end

  def encrypt_print(output, key_array)
    puts "Created #{output} with the key #{self.final_secret_key(key_array)} and date #{Time.new.strftime("%d%m%y")}"
  end

  def decrypt_print(output, key_array, date)
    puts "Created #{output} with the key #{self.final_secret_key(key_array)} and date #{date}"
  end

  def crack_print(output, secret_key)
    puts "Created #{output} with the key #{secret_key} and date #{Time.new.strftime("%d%m%y")}"
  end

  def final_secret_key(key_array)
    output = []
    key = key_array.join.chars
    key.map.with_index do |num, index|
      if index == 0 || index % 2 != 0
        output << num
      end
    end
    output.join
  end



end
