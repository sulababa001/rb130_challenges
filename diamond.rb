

class Diamond
  def self.make_diamond(letter)
    diamond_letter = letter.upcase
    array = ('A'..diamond_letter).to_a
    letter_index = array.index(diamond_letter)
    array_first_index = array.index(array.first) 
    span = ((array.index(diamond_letter) + 1) * 2) + 1

    array.each_with_index do |char, idx|
      if idx == 0
        puts char.center(span)
      else
       puts (char + (' ' * ((idx * 2) + 1)) + char).center(span)
      end
    end

    (letter_index - 1).downto(array_first_index) do |countdown|
      if countdown == 0
        puts array[countdown].center(span)
      else
        puts (array[countdown] + (' ' * ((countdown * 2) + 1)) + array[countdown]).center(span)
      end
    end
  end
end

Diamond.make_diamond('A')
Diamond.make_diamond('e')
Diamond.make_diamond('c')
