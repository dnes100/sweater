# Join table between Tweet and User representing a like

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :likes_count
end
