require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:activeapp.sqlite3"

# require './models'