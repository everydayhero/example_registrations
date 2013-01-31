class Token
  attr_reader :length, :tokenizer

  def initialize length = 20, tokenizer = SecureRandom
    @length    = length
    @tokenizer = tokenizer
  end

  def self.generate
    new.generate
  end

  def generate
    tokenizer.hex(length).encode('UTF-8')
  end
end
