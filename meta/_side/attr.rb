class Person
  class << self
    def attr_reader_local(*variable_names)
      variable_names.flatten.each do |variable_name|
        define_method(variable_name) do
          instance_variable_get("@#{variable_name}")
        end
      end
    end

    def attr_writer_local(*variable_names)
      variable_names.flatten.each do |variable_name|
        define_method("#{variable_name}=") do |new_value|
          instance_variable_set("@#{variable_name}", new_value)
        end
      end
    end

    def attr_accessor_local(*variable_names)
      attr_reader_local(variable_names)
      attr_writer_local(variable_names)
    end
  end

  attr_accessor_local :name, :age

  def initialize
    @name = 'Max'
    @age = 42
  end
end

man = Person.new
p man.name
man.name = 'John'
p man.name

p man.age
