# Represents a like on a post

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :likes_count
end
