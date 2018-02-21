require 'active_record'

class CreateProductTable < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.float :price
    end
  end

  def self.down
    drop.table :products
  end
end
