require 'rubygems'
require 'openssl'
require 'base64'

data = " abc123"

def encrypt(data)
  key = "\x4e\x99\x06\xe8\xfc\xb6\x6c\xc9\xfa\xf4\x93\x10\x62\x0f\xfe\xe8\xf4\x96\xe8\x06\xcc\x05\x79\x90\x20\x9b\x09\xa4\x33\xb6\x6c\x1b"
  cipher = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
  cipher.encrypt
  cipher.key = key
  repacked = data.unpack('C*').pack('v*')
  encrypted_data = cipher.update(repacked) + cipher.final
  encrypted_data = Base64.encode64(encrypted_data)
  encrypted_data = encrypted_data[0, encrypted_data.index('=')]
end

encrypted_data = encrypt(data)
puts encrypted_data