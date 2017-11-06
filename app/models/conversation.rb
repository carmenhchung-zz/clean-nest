class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  # If we delete the conversation, we delete all the messages.
  has_many :messages, dependent: :destroy

   # Conversation between users should be unique in the database.
  validates_uniqueness_of :sender_id, :recipient_id

  # No matter whether the sender or recipient is the user, return the whole conversation.
  scope :involving, -> (user) {
    where("conversations.sender_id = ? OR conversations.recipient_id = ?", user.id, user.id)
  }

  scope :between, -> (user_A, user_B) {
      where("(conversations.sender_id = ? OR conversations.recipient_id = ?) OR conversations.sender_id = ? OR conversations.recipient_id = ?", user_A, user_B, user_B, user_A)
    }
end
