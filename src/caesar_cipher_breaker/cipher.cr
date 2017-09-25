module CaesarCipherBreaker::Cipher
  extend self

  def encode(text, shift)
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    cipher = ('a'..'z').to_a.rotate(shift) + ('A'..'Z').to_a.rotate(shift)
    encoder = Hash.zip(alphabet, cipher)
    text.chars.map { |c| encoder.fetch(c, c) }.join
  end

  def decode(text, shift)
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    cipher = ('a'..'z').to_a.rotate(shift) + ('A'..'Z').to_a.rotate(shift)
    decoder = Hash.zip(cipher, alphabet)
    text.chars.map { |c| decoder.fetch(c, c) }.join
  end
end
