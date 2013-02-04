class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params[:message])

    if @message.save
      flash[:notice] = "Successfully created Message."
      @messages = Message.all
    end    
  end  
end