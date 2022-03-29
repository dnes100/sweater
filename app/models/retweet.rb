# Join table between Tweet and User representing a retweet
#
class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :retweets_count
end
