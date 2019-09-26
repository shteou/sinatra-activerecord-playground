require 'sinatra'
require "sinatra/json"
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
  json Thing.all
end

post '/things' do
  json Thing.create
end
