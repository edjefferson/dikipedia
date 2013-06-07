# app.rb
require "sinatra"
require "active_record"
require "mysql2"

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => ENV['DBADDRESS'],
  :username => ENV['DBUSER'],
  :password => ENV['DBPASS'],
  :database => ENV['DBNAME']
)

class Topic < ActiveRecord::Base
end



get '/topic/:text' do
	if (Topic.count(:conditions => "topic = params[:text]") == 0)

  Topic.create(:topic=> params[:text], :viewed_at => Time.now)
end
end