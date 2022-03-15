class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  validates_presence_of :email, :name, :uid
  validates_uniqueness_of :email, :uid

  def avatar_name
    if uid == 'dinesh'
      return 'dinesh_avatar.jpg'
    end

    'avatar.png'
  end
end
