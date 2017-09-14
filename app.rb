require 'sinatra'
require "sinatra/reloader" if development?


enable :sessions

get "/" do
	422
end

error 422 do
  'Access forbidden'
end

get"/title" do
  "Programming for Online Prototypes"
end

get"/catalog_description" do
  redirect 'https://github.com/daraghbyrne/onlineprototypes2017'
  end

get"/units" do
  redirect 'https://github.com/daraghbyrne/onlineprototypes2017/tree/master/guides'
end

get"/instructor" do
  redirect 'http://daraghbyrne.me/about-me/'
end

get'/links/:item' do
  item = params[:item]
  session[:item] = item
  if params[:item].to_s == "slack"
    "https://onlineprototypes2017.slack.com/messages/C6QT40TPD/"
  elsif params[:item].to_s == "site"
  "https://canvas.cmu.edu/courses/2138"
  elsif params[:item].to_s == "repo"
  "https://github.com/daraghbyrne/onlineprototypes2017"
  else
  "Oppppps...Please input slack, site or repo."
  end
end

get "/meeting_time/:schedule" do
  schedule = params[:schedule]
  session[:schedule] = schedule
  if params[:schedule].to_s == "class"
    "Class time = Tuesday 3:00-5:00pm & Thursday 3:00-5:00pm"
  elsif params[:schedule].to_s == "officehour"
    "Officehour = Friday 5:00-7:00pm"
  end
end
