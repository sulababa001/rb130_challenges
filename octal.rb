class Octal
  LETTERS = ('a'..'z').to_a
  OUT_OF_RANGE = %w(8 9)
  
  def initialize(number)
    @number = number
    @holding = [] 
  end

  def to_decimal 
    counter = 0
    while counter < LETTERS.size
      if @number.split('').include?(LETTERS[counter]) ||
        @number.split('').include?(OUT_OF_RANGE[0])   ||
        @number.split('').include?(OUT_OF_RANGE[1])
        @number = '0'
      else
        counter += 1
      end  
    end
    digits = @number.to_i.digits  
    n = 0
    digits.each do |digit|
      @holding << (digit * (8 ** n))
      n += 1
    end
    @holding.sum
  end
end

octal_1 = Octal.new('155')
p octal_1.to_decimal

octal_2 = Octal.new('1')
p octal_2.to_decimal == 1

octal_3 = Octal.new('10')
p octal_3.to_decimal == 8 

octal_4 = Octal.new('17')
p octal_4.to_decimal == 15

octal_5 = Octal.new('11')
p octal_5.to_decimal == 9

octal_6 = Octal.new('130')
p octal_6.to_decimal == 88 

octal_7 = Octal.new('2047')
p octal_7.to_decimal == 1063

octal_8 = Octal.new('7777')
p octal_8.to_decimal == 4095

octal_9 = Octal.new('1234567')
p octal_9.to_decimal == 342_391

octal_10 = Octal.new('carrot')
p octal_10.to_decimal == 0

octal_11 = Octal.new('8')
p octal_11.to_decimal == 0 

octal_12 = Octal.new('9')
p octal_12.to_decimal == 0 

octal_13 = Octal.new('6789')
p octal_13.to_decimal == 0

octal_14 = Octal.new('abc1z')
p octal_14.to_decimal == 0

octal_15 = Octal.new('011')
p octal_15.to_decimal == 9

octal_16 = Octal.new('234abc')
p octal_16.to_decimal == 0

