require_relative '../base'

module Controllers
  module Admin
    class Base < Controllers::Base
      use Rack::Auth::Basic do |username, password|
        Models::User.exists?(username, password)
      end
    end
  end
end
