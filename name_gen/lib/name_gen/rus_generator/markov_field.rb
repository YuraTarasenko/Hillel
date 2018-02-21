module NameGen
  module RusGenerator
    class MarkovField

      SYLLABLES = {
        'ни' => { 'ни' => 0.1, 'ми' => 0.3, 'ег' => 0.2, 'юр' => 0.2, 'то' => 0.2 },
        'ми' => { 'ни' => 0.1, 'ми' => 0.1, 'ег' => 0.3, 'юр' => 0.3, 'то' => 0.2 },
        'ег' => { 'ни' => 0.0, 'ми' => 0.0, 'ег' => 0.1, 'юр' => 0.4, 'то' => 0.5 },
        'юр' => { 'ни' => 0.0, 'ми' => 0.1, 'ег' => 0.5, 'юр' => 0.0, 'то' => 0.4 },
        'то' => { 'ни' => 0.4, 'ми' => 0.4, 'ег' => 0.1, 'юр' => 0.0, 'то' => 0.1 }
      }

      def initialize
        @current_syllable = SYLLABLES.keys.sample
        @result = []
      end

      def generate_name(syllables)
        syllables.times do
          next_syllable = get_next_syllable
          @result << next_syllable

          @current_syllable = next_syllable
        end

        @result.join.capitalize
      end

      private

      def get_next_syllable
        rand_value = rand
        current_percent = 0.0

        SYLLABLES[@current_syllable].each do |syllable, value|
          current_percent += value
          return syllable if rand_value <= current_percent
        end

        raise 'you should not see this message!'
      end
    end
  end
end
