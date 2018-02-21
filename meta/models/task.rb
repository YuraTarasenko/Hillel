class Task
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String
  property :params, Text
  property :done,   Boolean, default: false
end
