class ConversationsController < ApplicationController
  # Only registered users can message each other.

  before_action :authenticate_user!

  def index
    # Only allow the current user to access their conversations.
    @conversations = Conversation.involving(current_user)
  end

  def create
    # Check if there is an existing conversation between the users first - if there is, retrieve it (as a collection). If there is no existing conversation, then create a new one.
    if Conversation.where(sender_id: params[:sender_id]).where(recipient_id: params[:recipient_id]).present?
      @conversation = Conversation.where(sender_id: params[:sender_id]).where(recipient_id: params[:recipient_id]).first
    else
      @conversation = Conversation.create(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation.id)
  end

  private

    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
