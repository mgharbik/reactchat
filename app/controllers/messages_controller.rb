class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.new(message_params)
    @message.save
  end

  private
    def message_params
      params.require(:message).permit(:body).merge({
        user: current_user
      })
    end
end
