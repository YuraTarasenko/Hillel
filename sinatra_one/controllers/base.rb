require 'sinatra/base'

module Controllers
  class Base < Sinatra::Base
    configure do
      set :views, File.join(File.dirname(__FILE__), '..', 'views')
      set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
    end
  end
end
