require "option_parser"

module CaesarCipherBreaker::CLI
  extend self

  def run(args)
    decode = false
    encode = false
    version = false
    cipher_key = 0

    OptionParser.parse(args) do |parser|
      parser.banner = "Usage: caesar-breaker [options]"
      parser.on("-d KEY", "--decode KEY", "Decodes an encoded string") do |key|
        decode = true
        cipher_key = key.to_i
      end

      parser.on("-e KEY", "--encode KEY", "Encodes a string") do |key|
        encode = true
        cipher_key = key.to_i
      end

      parser.on("-v", "--version", "Show current version") do
        version = true
      end

      parser.invalid_option do
        puts parser
        exit
      end
      parser.missing_option do
        puts parser
        exit
      end
    end

    return show_version if version
    return encode(args.shift, cipher_key) if encode
    return decode(args.shift, cipher_key) if decode
    auto(args.shift)
  end

  private def auto(text)
    key, result = Breaker.break(text)
    puts "Key: #{key}"
    puts "Decoded: #{result[1]}"
    puts "Entropy: #{result[0]}"
  end

  private def encode(text, key)
    puts Cipher.encode(text, key)
  end

  private def decode(text, key)
    puts Cipher.decode(text, key)
  end

  private def show_version
    puts VERSION
  end
end
