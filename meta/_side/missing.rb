require 'yaml'

class Menu # in the caffee
  def initialize
    @menu = YAML.load(File.read('./foods.yml'))
  end

  def method_missing(method_name, *args)
    p 'method_missing!'

    if /get_/ =~ method_name
      define_singleton_method(method_name) do
        announce_food(method_name)
      end
    else
      raise NoMethodError.new("undefined method #{method_name}")
    end

    send(method_name)
  end

  private

  def announce_food(method_name)
    begin
      food = method_name.to_s.sub('get_', '')
      puts "Please wait for the #{food} for #{@menu.fetch(food)} minutes!"
    rescue KeyError
      puts "We don't allow #{food} at our place!"
    end
  end
end

menu = Menu.new

menu.get_chicken # someone wants chicken to eat
menu.get_ice_cream
menu.get_ice_cream
menu.get_coca_cola

menu_two = Menu.new
menu_two.get_ice_cream
