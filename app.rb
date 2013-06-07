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
	url = params[:text].to_s
	if (Topic.count(:conditions => "topic = '#{url}' AND date(viewed_at) = date('#{Time.now}')") == 0)

  Topic.create(:topic=> url, :viewed_at => Time.now)
end
end