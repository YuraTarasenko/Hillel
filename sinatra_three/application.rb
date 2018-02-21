require_relative 'config/configuration'

class Application < Sinatra::Base
  use Rack::MethodOverride

  use Controllers::Main
  use Controllers::Static
  use Controllers::Admin::Products
end
