require 'twitter'

twitter_config = YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]

Twitter.configure do |config|
  config.consumer_key = 'PVGke8Dn7VgmjJ7GBnKw'
  config.consumer_secret = 'jCKFTliN9bwEcVd5VEfFRqIEddQIgfkH5jAgfcJRmo'
  config.oauth_token = twitter_config['623636422-iLbG9AnyNIYH5xWb641ZWeZKjQaT1ETSd2pXIY3Y']
  config.oauth_token_secret = twitter_config['zaM00kSIcQFGjZ4Nlf5ws2CGzZmgw2y6SNbRP3uJUs']
end
