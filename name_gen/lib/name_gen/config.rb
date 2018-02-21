module NameGen
  class Config
    attr_accessor :type

    def initialize(type = :markov)
      @type = type
    end
  end
end
