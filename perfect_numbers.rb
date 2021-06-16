class PerfectNumber
  
  def self.classify(number)
    if number < 0
        raise StandardError
    else
      get_classification(number)
    end
  end

  def self.get_classification(number)
    factors = []
    1.upto(number - 1) do |num|
      if number % num == 0
        factors << num
      end
    end
    sum = factors.sum
    if sum < number
      return 'deficient'
    elsif sum == number
      return 'perfect'
    elsif sum > number
      return 'abundant'
    end
  end
end

p PerfectNumber.classify(13) == 'deficient'

p PerfectNumber.classify(28) == 'perfect'

p PerfectNumber.classify(12) == 'abundant'