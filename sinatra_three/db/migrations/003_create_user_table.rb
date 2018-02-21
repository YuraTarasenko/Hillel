require 'active_record'

class CreateUserTable < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
    end
  end

  def self.down
    drop.table :users
  end
end
