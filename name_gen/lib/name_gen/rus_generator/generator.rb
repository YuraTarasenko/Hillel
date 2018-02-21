module NameGen
  module RusGenerator
    class Generator
      def initialize
        @markov_field = NameGen::RusGenerator::MarkovField.new
      end

      def get_name(syllables)
        @markov_field.generate_name(syllables)
      end
    end
  end
end
