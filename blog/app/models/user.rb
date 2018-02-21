class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  def last_comments(count = 3)
    comments.order('created_at DESC').limit(count)
  end

  def self.last_user
    order('created_at DESC').first
  end
end
