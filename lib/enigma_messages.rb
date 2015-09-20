class EnigmaWriter

  def
    initialize
  end

  def encrypt_print(output, key_array)
    puts "Created #{output} with the key #{self.final_secret_key(key_array)} and date #{Time.new.strftime("%d%m%y")}"
  end

  def final_secret_key(key_array)
    key = ""
    # require 'pry';binding.pry
    string = key_array.join
    key << string[0..1]
    key << string[4..5]
    key << string[7]
  end

  def crack_print(output, secret_key)
    puts "Created #{output} with the key #{secret_key} and date #{Time.new.strftime("%d%m%y")}"
  end




end
