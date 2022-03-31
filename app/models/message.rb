# Represents a message
class Message < ApplicationRecord
  # author
  belongs_to :user

  belongs_to :recipient, class_name: 'User'


  # broadcasts target: ->(message) {
  #   "conversation_#{[message.user_id, message.recipient_id].sort.join('_')}"
  # }

  # Conversation id should be unique for each pair of users
  class ConversationId
    def self.call(message)
      "conversation_#{[message.user_id, message.recipient_id].sort.join('_')}"
    end
  end

  # First argument is the name of stream
  # target: dom id in html
  # In this case we use same stream name and dom target id
  broadcasts_to ConversationId, target: ConversationId

end


