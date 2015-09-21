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

  def crack_print(output, key_array, date)
    puts "Created #{output} with the key #{self.final_crack_code_key(key_array)} and date #{date}"
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

  def final_crack_code_key(key_array)
    counter = 0
    correct = []
    find_match = []
    string = key_array.join.chars
    while correct.length < 4
      if string[counter + 1] == string[counter + 2]
        correct << key_array[counter..(counter + 1)]
      else
        find_match << key_array[counter..(counter + 1)]
        correct << match?(find_match)
      end
      correct.flatten!
      counter += 2
    end
    final_secret_key(correct)
  end

  def match?(array)
    temp = array.flatten
    counter = 0
    awesome = []
    2.times do
      temp << temp[counter] + 39
      temp << temp[counter] + 78
      counter += 1
    end
    until awesome.length == 2
      key = temp.pop
      temp.each do |num|
        string = num.to_s.chars
        if key.to_s.chars[0] == string[1]
          awesome << num
          awesome << key
        end
      end
    end

    return awesome
  end


end
