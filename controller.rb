require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:activeapp.sqlite3"
require './models/all.rb'



get '/' do
	erb :index
end

post "/signup" do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
        redirect "/login"
    else
        redirect "/failure"
    end
end


post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/success"
    else
        redirect "/failure"
    end
end


get '/success' do
	erb :index
end


get '/failure' do
	erb :index
end