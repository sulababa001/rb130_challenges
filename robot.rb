class Robot
  @@existing_names = []

  def initialize
    @name = ''
    @letters = ('A'..'Z').to_a
    @numbers = (0..9).to_a
    @used_names = []
  end

  def name
    if !@name.empty?
      return @name
    else
      @name = set_name
      @used_names << set_name
    end
    @name
  end
  
  def reset
    @@existing_names.delete(@name)
    @name = ''
  end

  private

  def set_name
    prefix_letters = @letters.sample(2).join
    suffix_numbers = @numbers.sample(3).join
    new_name = prefix_letters + suffix_numbers
    unless @@existing_names.include?(new_name)
      @@existing_names << new_name
    end
    new_name
  end
end
