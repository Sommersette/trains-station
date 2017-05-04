require 'sinatra'
require 'sinatra/reloader'
require './lib/trains'
require 'pg'
require 'launchy'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
