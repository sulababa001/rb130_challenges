class Scrabble
  TILES = { 1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P),
          4 => %w(F H V W Y), 5 => %w(K), 8 => %w(J X), 10 => %w(Q Z) }
  
  def initialize(word)
    @split_word = word.upcase.split('')
    @score = 0
    @keys = TILES.keys
  end

  def get_letter_score(letter)
    @keys.each do |key|
      if TILES[key].include?(letter)
        return key
      end
    end
  end  

  def score 
    @split_word.each do |letter|
        @score += get_letter_score(letter)
      end
    @score
  end

  def self.score(word)
   get_score = Scrabble.new(word)
   get_score.score
  end
end

new_game = Scrabble.new('a') 
p new_game.score

game_2 = Scrabble.new('f')
p game_2.score

game_3 = Scrabble.new('street')
p game_3.score

game_4 = Scrabble.new('quirky')
p game_4.score

game_5 = Scrabble.new('OXYPHENBUTAZONE')
p game_5.score

p Scrabble.score('alacrity')