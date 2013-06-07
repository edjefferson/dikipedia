# app.rb
require "sinatra"
require "active_record"
require "mysql2"
require "twitter"
require "uri"
require "cgi"

class String
  def trim119
    tweet = self
    while tweet.length>119
      tweetwords=tweet.split(' ')
      tweet=tweetwords[0..-2].join(' ') << "..."
 
    end
    return tweet
  end
end

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => ENV['DBADDRESS'],
  :username => ENV['DBUSER'],
  :password => ENV['DBPASS'],
  :database => ENV['DBNAME']
)

Tweets = Twitter.configure do |config|
    config.consumer_key = ENV['YOUR_CONSUMER_KEY']
    config.consumer_secret = ENV['YOUR_CONSUMER_SECRET']
    config.oauth_token = ENV['YOUR_OAUTH_TOKEN']
    config.oauth_token_secret = ENV['YOUR_OAUTH_TOKEN_SECRET']
 end


class Topic < ActiveRecord::Base
end



get '/topic/:text' do
	url = params[:text].to_s.split("/")

	
  decodedurl = URI.decode(params[:text])
	
	puts url[-1]
	if (Topic.count(:conditions => "topic = '#{url[-1]}' AND date(viewed_at) = date('#{Time.now}')") == 0)

  Topic.create(:topic=> url[-1], :viewed_at => Time.now)
  Tweets.update("#{CGI::unescape(url[-1]).gsub("_"," ").trim119} #{decodedurl}")
end
end