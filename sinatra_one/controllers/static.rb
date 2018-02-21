require_relative 'base'

module Controllers
  class Static < Controllers::Base

    get '/about' do
      slim :about
    end

    get '/contacts' do
      slim :contacts
    end

  end
end
