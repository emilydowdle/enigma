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
    double_checked = []
    find_match = []
    string = key_array.join.chars
    correct = find_correct_key_from_rotations(correct, string, key_array, counter, find_match)
    output = final_secret_key(correct)
    output
  end

  def find_correct_key_from_rotations(correct, string, key_array, counter, find_match)
    while correct.length < 4
      if string[counter + 1] == string[counter + 2]
        correct << key_array[counter..(counter + 1)]
      else
        find_match << key_array[counter..(counter + 1)]
        correct << return_adjusted_key(find_match)
      end
      correct.flatten!
      counter += 2
    end
    correct
  end

  def create_key_possibilities(temp)
    2.times do |num|
      temp << temp[num] + 39
      temp << temp[num] + 78
    end
    temp
  end

  def return_adjusted_key(array)
    temp = array.flatten
    secret_key = []
    possibility_array = create_key_possibilities(temp)
    secret_key = compare_possibilities_to_find_match(secret_key, possibility_array)
  end

  def iterate_over_possibility_array(secret_key, possibility_array, key)
    possibility_array.each do |num|
      string = num.to_s.chars
      if key.to_s.chars[0] == string[1]
        secret_key << num
        secret_key << key
      end
    end
    return secret_key
  end

  def compare_possibilities_to_find_match(secret_key, possibility_array)
    until secret_key.length == 2
      key = possibility_array.pop
      secret_key = iterate_over_possibility_array(secret_key, possibility_array, key)
    end
    secret_key
  end

end
