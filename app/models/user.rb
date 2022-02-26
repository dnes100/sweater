class User < ApplicationRecord

  has_many :tweets

  validates_presence_of :email, :name, :uid
  validates_uniqueness_of :email, :uid

  def avatar_name
    'dinesh_avatar.jpg'
  end
end
