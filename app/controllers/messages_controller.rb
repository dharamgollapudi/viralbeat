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

  def edit
    @message = current_user.messages.find(params[:id])
  end 

  def update
    @message = current_user.messages.find(params[:id])

    if @message.update_attributes(params[:message])
      flash[:notice] = "Successfully updated Message."
      @messages = Message.all
    end   
  end   

  def show
    @message = Message.find(params[:id])
    
    respond_to do |format|
      format.js 
    end
  end  
end