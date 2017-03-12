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

  def show
    @message=Message.find(params[:id])
  end

  def destroy
    @message=Message.find(params[:id])
    @message.destroy
    flash.now[:notice] = 'Your message has been deleted!'
    redirect_to messages_path
  end

  def check_password
    @message=Message.find(params[:id])
    entered_password=params[:password]
    if @message.password == entered_password
      @correct_password = true
    else
      flash.now[:error] = 'You entered the wrong passsword!'
    end
    render :show
  end

  private
  def message_params
    params.require(:message).permit(:text,:password,:password_confirmation,:recipient)
  end

end
