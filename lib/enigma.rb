class Enigma

  def initialize
  end

  def read_file(input_file)
    handle = open(input_file)
    handle.read.downcase
  end

  def write_file(encrypted_message, output_file)
    handle = open(output_file, 'w')
    handle.puts(encrypted_message)
    handle.close
  end

end
