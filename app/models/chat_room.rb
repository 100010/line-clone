class ChatRoom < ApplicationRecord
  has_many :chat_room_users
  has_many :users, through: :chat_room_users
  has_many :messages

  STATUS_HASH  = {
    personal: 0,
    group: 1
  }

  enum status: ChatRoom::STATUS_HASH

  def update_group!
    if self.users.count > 2
      self.update(status: 2)
    end
  end
end
