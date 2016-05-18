require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:activeapp.sqlite3"
require './models/all.rb'
enable  :sessions


get '/' do
	erb :index
end


post "/signup" do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
        redirect "/login"
    else
        redirect "/failure/nosignup"
    end
end

get '/login' do
	@status = "Signup Successful"
	erb :index
end


post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/success"
    else
        redirect "/failure/nologin"
    end
end


get '/success' do
	@status = "You're in!"
	@user = User.find_by(id: session[:user_id] )
	erb :index
end


get '/failure/:event' do
	if params[:event] == "nologin"
		@status = "No Go. Try again"
		erb :index
	elsif params[:event] == "nosignup"
		@error = "Signup Unsuccessful"
		erb :index
	end
end

get '/logout' do
	session.clear
	erb :index
end

