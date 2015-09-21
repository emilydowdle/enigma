require_relative 'decryption_machine'

input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]

message = Decrypt.new
message.decrypt_runner(input, output, key, date)
