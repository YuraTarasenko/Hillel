module Models
  class User < ActiveRecord::Base
    def self.exists?(username, password)
      !where(username: username, password: Gibberish::SHA1(password)).empty?
    end
  end
end
