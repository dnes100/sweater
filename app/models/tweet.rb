class Tweet < ApplicationRecord
  belongs_to :user

  # NOTE: This tweet is commented in reply to parent tweet
  #   counter_cache (replies_count) column is read_only
  #   To reset/update counter_cache of a tweet, Tweet.reset_counters(tweet_id, :replies_count)
  belongs_to :parent, class_name: "Tweet", counter_cache: :replies_count, optional: true

  # Reverse of parent tweet
  has_many :replies, class_name: "Tweet", foreign_key: "parent_id"

  has_many :likes, dependent: :destroy

  # NOTE: retweets are just like 'likes' table.
  #   We could easily use single table for likes and retweets with extra column.
  #   But using separate table to work with counter_cache easily.
  has_many :retweets, dependent: :destroy



  # enum tweet_type: {

  #   # original/root tweet without parent_id
  #   original: 0,

  #   # has both parent_id and content
  #   reply: 1,


  #   # has both parent_id and content, differs from reply in that it is like a retweet
  #   quote: 2,
  # }

  validates_presence_of :content
end
