class MessagesController < ApplicationController

  def index
    # NOTE: union query to find users participating in conversation (either sender or recipient)
    id = current_user.id
    joins = "join messages where messages.user_id = #{id} or messages.recipient_id = #{id}"
    @users = User.joins(joins).distinct
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save!
  end

  # TODO search for message content as well (so its different from normal user/keyword search)
  #   May be use index action for this as well?
  def search
    if params[:query].present?
      @users = User.where('name like :q or email like :q or uid like :q', q: "%#{params[:query]}%")
    else
      @users = current_user.collocutors
    end
  end

  # Takes recipient_id param
  def show_conversation
    @recipient = User.find(params[:recipient_id])
    @messages = Message.where(user: [current_user, @recipient])
      .where(recipient: [current_user, @recipient])
      .order(created_at: :asc)
  end

  private

  def message_params
    params.require(:message).permit(:content, :recipient_id)
  end
end
