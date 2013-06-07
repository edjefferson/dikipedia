# app.rb
require "sinatra"
require "active_record"
require "mysql2"

#DB_CONFIG = YAML::load(File.open('config/database.yml'))

#set :database, "mysql:///#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{DB_CONFIG['host']}:#{DB_CONFIG['port']}/#{DB_CONFIG['database']}"

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
  Topic.create(:topic=> params[:text])
end