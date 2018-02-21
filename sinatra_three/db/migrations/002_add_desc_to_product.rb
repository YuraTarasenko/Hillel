require 'active_record'

class AddDescToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.text :description
    end
  end

  def self.down
    change_table :products do |t|
      t.remove :description
    end
  end
end
