# app.rb
require "sinatra"
require "active_record"
require "mysql2"

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "us-cdbr-east-03.cleardb.com",
  :username => "b205cafa461f0e",
  :password => "e492bbc6",
  :database => "heroku_366703dfec33808"
)

class Topic < ActiveRecord::Base
end


get '/topic/:text' do
  Topic.create(:topic=> params[:text])
end