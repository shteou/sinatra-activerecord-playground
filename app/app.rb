require 'sinatra'
require "sinatra/json"
require 'active_record'
require 'mysql2'
require 'yaml'

ActiveRecord::Base.establish_connection(YAML.load_file('config/database.yml'))

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
