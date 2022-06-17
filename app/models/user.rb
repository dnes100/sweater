# Represents twitter account

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  # follows join table, user follows other users.
  has_many :follows
  has_many :followings, through: :follows, source: :following

  # Reverse of follows relation, user is followed by other users.
  has_many :follower_relations, class_name: 'Follow', foreign_key: :following_id
  has_many :followers, through: :follower_relations, source: :user

  has_many :likes
  has_many :retweets

  has_many :messages
  # NOTE: collocutors means other users who one is talking to.
  has_many :collocutors, through: :messages, source: :recipient

  validates_presence_of :email, :name, :uid
  validates_uniqueness_of :email, :uid

  def following?(user)
    followings.include?(user)
  end

  def avatar_name
    if uid == 'dinesh'
      return 'dinesh_avatar.jpg'
    end

    # We render initial letter as avatar instead.
    # 'avatar.png'
  end

  def cover_image
    'beach_cover.jpg'
  end
end
