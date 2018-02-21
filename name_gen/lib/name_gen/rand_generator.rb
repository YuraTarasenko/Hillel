module NameGen
  class RandGenerator
    CONS = %w(q w r t p s d f g h j k l z x c v b n m)
    VOWELS = %w(e y u i o a)

    OPTIONS = [:con1_vow1, :con1, :con1_vow2, :vow1]

    def initialize
    end

    def get_name(elements)
      result_name = []

      elements.times do
        result_name << get_syllable
      end

      result_name.join.capitalize
    end

    private

    def get_syllable
      case OPTIONS.sample
      when :con1_vow1
        [].push(CONS.sample).push(VOWELS.sample).shuffle.join
      when :con1_vow2
        [].push(CONS.sample).push(VOWELS.sample).push(VOWELS.sample).shuffle.join
      when :con1
        CONS.sample
      when :vow1
        VOWELS.sample
      end
    end
  end
end
