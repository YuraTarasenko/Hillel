require 'json'
require 'sinatra'

require_relative './config/config'

get '/' do
  @tasks = Task.all
  erb :index, locals: { tasks: @tasks }
end

post '/' do
  params['args'] = [] if params['args'].nil?

  args = Hash[*params['args'].map do |key, value|
    [key, (value.match(/^\d+$/) ? value.to_i : value)]
  end.flatten]

  Task.create(name: params['name'], params: args.to_json)

  redirect '/'
end
