require_relative 'encryption_machine'

input_filename = ARGV[0]
output_filename = ARGV[1]

message = Encrypt.new
message.encrypt_runner(input_filename, output_filename)
