class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :chatroom, presence: true
  validates :user, presence: true
  validates :body, presence: true
end
