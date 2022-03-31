# Represents a message
class Message < ApplicationRecord
  # author
  belongs_to :user

  belongs_to :recipient, class_name: 'User'


  # broadcasts target: ->(message) {
  #   "conversation_#{[message.user_id, message.recipient_id].sort.join('_')}"
  # }

  # Conversation id should be unique for each pair of users
  # class ConversationId
  #   def self.call(message)
  #     "conversation_#{[message.user_id, message.recipient_id].sort.join('_')}"
  #   end
  # end

  # # First argument is the name of stream
  # # target: dom id in html
  # # In this case we use same stream name and dom target id
  # broadcasts_to ConversationId, target: ConversationId

  after_create_commit :broadcast_message

  def stream_name_for_author
    "messages_#{user_id}_#{recipient_id}"
  end

  def stream_name_for_recipient
    "messages_#{recipient_id}_#{user_id}"
  end

  private

  # NOTE: broadcast to 2 separate streams for sender and recipient since we send same message to each a bit differently.
  #   Eg: users with id 1 and 2 are chatting with each other.
  #   user 1 will listen to stream "messages_1_2" and user 2 will listen to stream "messages_2_1"
  #   Server will send messages to both streams: "messages_1_2" and "messages_2_1"
  #
  def broadcast_message
    # broadcast to author
    broadcast_append_later_to(
      stream_name_for_author,
      target: stream_name_for_author,
      partial: 'messages/message_to_author'
    )

    # broadcast to receiver
    broadcast_append_later_to(
      stream_name_for_recipient,
      target: stream_name_for_recipient,
      partial: 'messages/message_to_recipient'
    )
  end
end
