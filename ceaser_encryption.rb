# Encryption with Ceaser's Chipher

class Cipher

  def initialize(plain_cipher_string, intshift)
    @plain_cipher_string = plain_cipher_string.split('')
    @intshift = intshift
    @cipher_array = []
    @encrypted_array = []
    @decrypted_array = []
    @original_cipher = []
  end


  def cipher_number_map(alphabet_hash)
    @plain_cipher_string.each do|char|
      alphabet_hash.map{|num, alphabet| @cipher_array << num if alphabet == char }
    end
    @cipher_array
  end


  def encryption_array
    @cipher_array.each do|value|
      if value + @intshift > 25
        ctr = value + @intshift - 26
      else
        ctr = value + @intshift
      end
      @encrypted_array << (ctr) % 26
    end
    @encrypted_array
  end

  def get_encrypted_string(alphabet_hash)
   @encrypted_array.each do|index|
      alphabet_hash.select{|num, alphabet| @original_cipher << alphabet if num == index }
    end
    @original_cipher.join
  end


end

class Alphabetmap

  def self.set_alphabet_number_hash
    begindex = "A".ord
    endindex = "Z".ord
    alphabet_hash = {}
    (begindex..endindex).each{|index| alphabet_hash[index - begindex] = index.chr}
    alphabet_hash
  end

end


puts "Enter cipher string"
plain_cipher_string = gets.chomp
puts "Enter integer shift"
integer_shift = gets.chomp.to_i
encrypt_cipher = []
plain_cipher_array = plain_cipher_string.split(' ')
# setting a map for numerical representation of the alphabets
alphabet_hash = Alphabetmap.set_alphabet_number_hash

plain_cipher_array.each do|word|
  cipher = Cipher.new(word.upcase, integer_shift)
  # find the numerical mapping for the string
  cipher_array = cipher.cipher_number_map(alphabet_hash)
  # encrypt the string
  encrypted_array = cipher.encryption_array
  # get the encrypted string
  encrypt_cipher << cipher.get_encrypted_string(alphabet_hash)
end

puts "Encrypted String:", encrypt_cipher.join(' ')



