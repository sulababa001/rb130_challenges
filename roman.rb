class RomanNumeral
  ROMAN_NUMERALS = {1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 
                    10 => 'X', 5 => 'V', 1 => 'I' }
  def initialize(number)
    @number = number
  end

  def to_roman
    roman = ''
    remainder = @number
    while remainder > 0
      size = remainder.digits.size
      if size == 4
        (remainder / 1000).times {roman << ROMAN_NUMERALS[1000]}
        remainder %= 1000
      elsif size == 3 && ROMAN_NUMERALS.has_key?((remainder.floor(-2) + 100))
        roman <<  ROMAN_NUMERALS[100]
        roman << ROMAN_NUMERALS[remainder.floor(-2) + 100]
        remainder %= 100
      elsif size == 3 && !(ROMAN_NUMERALS.has_key?((remainder.floor(-2) + 100))) && remainder > 500
        roman << ROMAN_NUMERALS[500]
        remainder -= 500
      elsif size == 3 && !(ROMAN_NUMERALS.has_key?((remainder.floor(-2) + 100))) && remainder < 500
        (remainder / 100).times {roman << ROMAN_NUMERALS[100]}
        remainder %= 100
      elsif size == 2 && ROMAN_NUMERALS.has_key?((remainder.floor(-1) + 10))
        roman << ROMAN_NUMERALS[10]
        roman << ROMAN_NUMERALS.has_key?((remainder.floor(-1) + 10))
        remainder %= 10 
      elsif size == 2 && !ROMAN_NUMERALS.has_key?((remainder.floor(-1) + 10)) && remainder > 50
        roman << ROMAN_NUMERALS[50]
        remainder -= 50
      elsif size == 2 && !ROMAN_NUMERALS.has_key?((remainder.floor(-1) + 10)) && remainder < 50
        (remainder / 10).times {roman << ROMAN_NUMERALS[10]}
        remainder %= 10
      elsif size == 1 && ROMAN_NUMERALS.has_key?(remainder + 1)
        roman << 'I'
        roman << ROMAN_NUMERALS[remainder + 1]
        remainder = 0
      elsif size == 1 && ROMAN_NUMERALS.has_key?(remainder)
        roman << ROMAN_NUMERALS[remainder]
        remainder = 0 
      elsif size == 1 && !ROMAN_NUMERALS.has_key?(remainder + 1) && remainder > 5
        roman << ROMAN_NUMERALS[5]
        remainder -= 5
      elsif size == 1 && !ROMAN_NUMERALS.has_key?(remainder + 1) && remainder < 5 
        remainder.times do
        roman << 'I'
        remainder = 0
        end     
      end
    end
    roman
  end
end

numrom = RomanNumeral.new(2954)
p numrom.to_roman