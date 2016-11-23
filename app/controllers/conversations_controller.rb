class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to new_profile_path if !current_user.profile.present?
    @users = User.all
    @conversations = Conversation.with(current_user.id)
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id])
      .present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
