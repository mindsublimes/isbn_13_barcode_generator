require 'pry'

class GenerateBarcode
  def initialize(text)
    @text = text.to_s
  end

  def create
    characters = @text.split('')
    even_characters = get_even_characters(characters)
    odd_characters = get_odd_characters(characters)
    total_sum = get_total_sum(even_characters, odd_characters)
    generate_isbn_13_barcode(characters, total_sum)
  end

  def get_even_characters(chars)
    chars.select.each_with_index { |_, i| i.even? }
  end

  def get_odd_characters(chars)
    chars.select.each_with_index { |_, i| i.odd? }
  end

  def get_total_sum(even_chars, odd_chars)
    even_chars.map{|n| n.to_i}.sum + odd_chars.map{|n| n.to_i * 3}.sum
  end

  def generate_isbn_13_barcode(characters, total_sum)
    number = 10 - total_sum.modulo(10)
    if number == 10
      puts characters.push(0).join
    else
      puts characters.push(number).join
    end
  end
end
