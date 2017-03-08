class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message=Message.create(message_params)
    if @message.save
      flash[:notice] = 'Your message has been created!'
      redirect_to messages_path
    else
      render :new
    end
  end

  def coolio

  end

  private
  def message_params
    params.require(:message).permit(:text,:password,:password_confirmation,:recipient)
  end

end
