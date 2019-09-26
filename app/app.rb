require 'sinatra'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  database: 'test',
  username: 'root',
  password: '',
  host:     'mysql'
)

require './app/models/thing.rb'

get '/' do
  'Put this in your pipe & smoke it!'
end

get '/things' do
  Thing.all
end
