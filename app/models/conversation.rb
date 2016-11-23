class Conversation < ApplicationRecord
  # relationships
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy

  # validation
  validates_uniqueness_of :sender_id, :scope => :recipient_id


  # method that searches for either of the two
  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  scope :with, -> (user_id) do
    where("sender_id =? OR recipient_id =?", user_id, user_id)
  end
end
