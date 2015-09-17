require './lib/encrypt'

class Enigma

  def initialize
  end

  def process(input_file, output_file)
    secret_message = read_file(input_file)
    encrypted_message = encrypt(secret_message)
    write_file(html, output_file)
  end

  def read_file(input_file)
    handle = open(input_file)
    handle.read
  end

  def write_file(encrypted_message, output_file)
    handle = open(output_file, 'w')
    handle.puts(encrypted_message)
    handle.close
  end

end
