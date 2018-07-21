require 'twitter'
require 'dotenv'

intent "LaunchRequest" do

end

intent "GetNewIntent" do

  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  end

  tweets = []
  File.open('Tweets/tweet.txt') do |tweet_txt|
    tweet_txt.each_line do |tweet_line|
      tweets.push("#{tweet_line}")
    end
    tweet_sample = tweets.sample
    client.update(tweet_sample)
    tell("#{tweet_sample}と呟きました。")
  end

end

intent "Test" do
  respond("Hello World!")
end

intent "SessionEndedRequest" do
  respond("Helloworld!")
end