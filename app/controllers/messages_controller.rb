class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  # If the current user is either the sender or recipient of messages for a particular conversation, pull it up. If they are the sender, then the other person is the recipient - otherwise, that other person is the sender. Show messages in descending order. If they are not the sender or recipient in the conversation, alert and redirect them away.
  def index
    if current_user == @conversation.sender || current_user == @conversation.recipient
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversations_path, alert: "You cannot view this conversation."
    end
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order("created_at DESC")

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  # Method to delete the message.
  def destroy
    @message.destroy
    # respond_to :js
    # Responds to javascript - use with ajax
  end

  private

    def render_message(message)
      self.render(partial: 'messages/message', locals: {message: message})
    end

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:content, :user_id)
    end
end
