module NameGen
  class Generator
    def initialize
      @markov_generator = NameGen::MarkovGenerator.new
      @rand_generator = NameGen::RandGenerator.new
      @rus_generator = NameGen::RusGenerator::Generator.new
    end

    def get_name(syllables)
      case NameGen::configuration.type
      when :markov
        @markov_generator.get_name(syllables)
      when :rand
        @rand_generator.get_name(syllables)
      when :rus
        @rus_generator.get_name(syllables)
      end
    end

  end
end
