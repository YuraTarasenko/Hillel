module Models
  class Product < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :price, numericality: { greater_than: 0 }
  end
end
