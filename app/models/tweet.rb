class Tweet < ApplicationRecord
  belongs_to :user

  # NOTE: This tweet is commented in reply to parent tweet
  #   counter_cache (replies_count) column is read_only
  #   To reset/update counter_cache of a tweet, Tweet.reset_counters(tweet_id, :replies_count)
  belongs_to :parent, class_name: "Tweet", counter_cache: :replies_count, optional: true

  # Reverse of parent tweet
  has_many :replies, class_name: "Tweet", foreign_key: "parent_id"

  has_many :likes, dependent: :destroy

  validates_presence_of :content
end
