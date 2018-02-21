class Word
  attr_reader :visible_word, :secret_word

  CATEGORIES = {
    star_wars: Faker::StarWars.vehicle,
    harry_potter: Faker::HarryPotter.character,
    lotr: Faker::LordOfTheRings.character
  }

  def initialize(category)
    @secret_word = CATEGORIES[category].downcase
    @visible_word = '_' * @secret_word.length
  end

  def char_exists?(char)
    indexes = find_indexes(char)

    update_visible_word(indexes, char)

    !indexes.empty?
  end

  def finished?
    !@visible_word.include?('_')
  end

  def update_visible_word(indexes, char)
    indexes.each do |index|
      @visible_word[index] = char
    end
  end

  def find_indexes(char)
    indexes = []

    @secret_word.split('').each_with_index do |symbol, index|
      indexes << index if symbol == char
    end

    indexes
  end
end
