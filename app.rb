# app.rb
require "sinatra"
require "active_record"
require "mysql2"
require "twitter"

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => ENV['DBADDRESS'],
  :username => ENV['DBUSER'],
  :password => ENV['DBPASS'],
  :database => ENV['DBNAME']
)
=begin
Twitter = Twitter.configure do |config|
    config.consumer_key = ENV['YOUR_CONSUMER_KEY']
    config.consumer_secret = ENV['YOUR_CONSUMER_SECRET']
    config.oauth_token = ENV['YOUR_OAUTH_TOKEN']
    config.oauth_token_secret = ENV['YOUR_OAUTH_TOKEN_SECRET']
 end
=end

class Topic < ActiveRecord::Base
end



get '/topic/:text' do
	url = params[:text].to_s.split("/")
	puts url[-1]
	if (Topic.count(:conditions => "topic = '#{url}' AND date(viewed_at) = date('#{Time.now}')") == 0)

  Topic.create(:topic=> url, :viewed_at => Time.now)
  #Twitter.update(url)
end
end