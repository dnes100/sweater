class Tweet < ApplicationRecord
  belongs_to :user

  # This tweet is commented in reply to parent tweet
  belongs_to :parent, class_name: "Tweet", optional: true

  # Reverse of parent tweet
  has_many :replies, class_name: "Tweet", foreign_key: "parent_id"

  validates_presence_of :content
end
