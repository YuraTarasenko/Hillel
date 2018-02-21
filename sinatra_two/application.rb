require_relative 'config/configuration'

class Application < Sinatra::Base
  use Controllers::Main
  use Controllers::Static
end
