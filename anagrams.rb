class Anagram
  def initialize(word)
    @word = word.downcase
    @anagrams = []
  end

  def match(list)
    counter = 0
      while counter < list.size
        if @word.split('').sort == list[counter].downcase.split('').sort &&
          @word != list[counter].downcase
          @anagrams << list[counter]
        end
        counter += 1
      end
    @anagrams
  end
end

detector = Anagram.new('listen')
p detector.match %w(enlists google inlets banana)

detector = Anagram.new('master')
p detector.match(%w(stream pigeon maters))

detector = Anagram.new('galea')
p detector.match(['eagle'])

detector = Anagram.new('corn')
p detector.match %w(corn dark Corn rank CORN cron park)

detector = Anagram.new('mass')
p detector.match(['last'])

detector = Anagram.new('good')
p detector.match(%w(dog goody))

detector = Anagram.new('allergy')
p detector.match %w( gallery ballerina regally clergy largely leading)

detector = Anagram.new('Orchestra')
p detector.match %w(cashregister Carthorse radishes)