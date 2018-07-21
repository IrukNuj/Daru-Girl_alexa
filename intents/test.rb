require 'twitter'
require 'dotenv'

intent "LaunchRequest" do

end

intent "GetNewIntent" do

  client = Twitter::REST::Client.new do |config|
    config.consumer_key = '2nSXrucAvvI9XKxjQcZUn0uFX'
    config.consumer_secret = '1hudid8U6Z9Z2Gj6EeHV28G04ni0zVeMAPcuWUfFRGUOVX1WvI'
    config.access_token = '997858584699420672-iM8qSdOtoLXaXWWho058urWuP2Kci47'
    config.access_token_secret = 'RTNXv3KAdDSHX1YO9sLiOdKijvKOEVGKTfFdFd8Gv6wBr'
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