class SumOfMultiples
  def initialize(*nums)
    if nums.empty?
      @list = [3, 5]      
    else
      @list = nums.to_a
    end
    @multiples = []
  end

  def to(number)
    @list.each do |item|
      1.upto(number) do |multiple|
        product = item * multiple
        if product < number
          @multiples << product
        end
      end
    end
    @multiples.uniq.sum
  end

  def self.to(number)
    @@list = [3, 5]
    @@multiples = []
    @@list.each do |item|
      1.upto(number) do |multiple|
        product = item * multiple
        if product < number
          @@multiples << product
        end
      end     
    end
    @@multiples.uniq.sum
  end
end

p SumOfMultiples.to(1) == 0
p SumOfMultiples.to(4) == 3
p SumOfMultiples.to(10) == 23
p SumOfMultiples.to(100) == 2_318
p SumOfMultiples.to(1000) == 233_168
p SumOfMultiples.new(7, 13, 17).to(20) == 51
p SumOfMultiples.new(4, 6).to(15) == 30
p SumOfMultiples.new(5, 6, 8).to(150) == 4419
p SumOfMultiples.new(43, 47).to(10_000) == 2_203_160