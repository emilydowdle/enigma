class KeyGenerator

  def initialize
  end

  def create_key
    key = random_generator
    key_array = create_key_array(key)
  end

  def random_generator
    key = []
    5.times do
      key << rand(0..9)
    end
    key
  end

  def create_key_array(key)
    if key.class == String
      key = key.chars
    end
    counter = 0
    key_array = []
    key.each_with_index do |num, index|
      key_array << "#{key[counter]}#{key[counter + 1]}".to_i
      counter += 1
    end
    key_array[0..-2]
  end

end
