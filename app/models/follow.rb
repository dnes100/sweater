# Represents following --> following relation between users
#
#                            follows
# follower (user_id) -------------------> following (following_id)

class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :following, class_name: 'User'
end
