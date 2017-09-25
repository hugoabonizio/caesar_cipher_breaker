module CaesarCipherBreaker::Breaker
  extend self

  # Unigram model frequencies for letters A..Z
  ENGLISH_FREQS = [
    0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025, 0.02406,
    0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150, 0.01974, 0.00074,
  ]

  def break(text)
    results = Hash(Int32, Tuple(Float64, String)).new

    26.times do |i|
      decoded = Cipher.decode(text, i)
      results[i] = {entropy(decoded), decoded}
    end

    results.to_a.sort_by(&.[1][0])[0]
  end

  private def entropy(text)
    sum = 0
    ignored = 0
    text.chars.each do |char|
      c = char.ord
      if 65 <= c <= 90
        sum += Math.log(ENGLISH_FREQS[c - 65])
      elsif 97 <= c <= 122
        sum += Math.log(ENGLISH_FREQS[c - 97])
      else
        ignored += 1
      end
    end
    -sum / Math.log(2) / (text.size - ignored)
  end
end
