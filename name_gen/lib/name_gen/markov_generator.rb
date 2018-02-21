module NameGen
  class MarkovGenerator
    def initialize
      @elements_collection = File.read(File.join(File.dirname(__FILE__),
                                                 '..', '..', 'config',
                                                 'syllable.txt')).split
    end

    def get_name(elements)
      result_name = []

      elements.times do
        result_name << @elements_collection.sample
      end

      result_name.join.capitalize
    end
  end
end
