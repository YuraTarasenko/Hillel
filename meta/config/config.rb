require 'yaml'

require 'data_mapper'
require 'dm-sqlite-adapter'

require_relative '../models/task'

DataMapper.setup(:default, "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/task.db")
DataMapper.finalize
DataMapper.auto_upgrade!

if Task.count.zero?
  seed = YAML.load(File.read('/home/hillel/ruby-work/hillel-ruby/meta/config/seed.yaml'))['seed']
  seed.each { |task| Task.create(name: task['name'], params: task['params']) }
end
