require "./spec_helper"
require "../src/caesar_cipher_breaker/cipher"

describe CaesarCipherBreaker::Cipher do
  it "encodes" do
    CaesarCipherBreaker::Cipher.encode("a", 3).should eq "d"
    CaesarCipherBreaker::Cipher.encode("abc", 3).should eq "def"
    CaesarCipherBreaker::Cipher.encode("abc", 26).should eq "abc"
  end

  it "decodes" do
    CaesarCipherBreaker::Cipher.decode("d", 3).should eq "a"
    CaesarCipherBreaker::Cipher.decode("def", 3).should eq "abc"
    CaesarCipherBreaker::Cipher.decode("def", 26).should eq "def"
  end
end
