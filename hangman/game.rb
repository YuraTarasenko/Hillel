require_relative 'life_counter'
require_relative 'word'

class Game
  def initialize
    @life_counter = LifeCounter.new
    @word = Word.new(read_category)
  end

  def run
    game_loop
    check_result
  end

  private

  def game_loop
    loop do
      announce_game_state

      guessed = @word.char_exists?(read_input)

      if guessed
        break if @word.finished?
      else
        @life_counter.decrement
        break if @life_counter.dead?
      end
    end
  end

  def announce_game_state
    puts "Your life total is #{@life_counter.life_count}"
    puts "Your word is #{@word.visible_word}"
  end

  def read_category
    puts 'Enter your category!'
    puts 'star_wars => StarWars'
    puts 'harry_potter => Harry Potter'
    puts 'lotr => Lord of The Rings'

    gets.chomp!.to_sym
  end

  def read_input
    puts 'Enter your char:'
    gets.chomp!.to_s
  end

  def check_result
    if @word.finished?
      puts 'You are victorious!'
    else
      puts 'You are dead...'
    end

    puts "Your word is #{@word.secret_word}"
  end
end
