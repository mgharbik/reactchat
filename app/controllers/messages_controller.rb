class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.new(message_params)
    if @message.save
      ChatroomChannel.broadcast_to(@chatroom,
        message: MessagesController.render(
          partial: 'messages/message',
          locals: { message: @message }))
    end
  end

  private
    def message_params
      params.require(:message).permit(:body).merge({
        user: current_user
      })
    end
end
