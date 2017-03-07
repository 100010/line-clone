class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, UserImageUploader


  has_many :friend_relations
  has_many :friends, through: :friend_relations, class_name: "User"

  has_many :messages
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users


  def add_friend(user)
    self.friend_relations.create(friend_id: user.id)
    user.friend_relations.create(friend_id: self.id)
  end

  def quit_friend(user_id)
    self
      .friend_relations
      .where(friend_id: user_id)
      .first
      .destroy
  end

end
