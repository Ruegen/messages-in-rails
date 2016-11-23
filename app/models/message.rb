class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  # validates that all the fields have values
  validates_presence_of :body, :conversation_id, :user_id

  # makes your message's time more readable to humans
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
