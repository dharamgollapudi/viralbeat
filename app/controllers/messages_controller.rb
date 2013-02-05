class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.paginate(:page => params[:page]).order_by_latest
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params[:message])

    if @message.save
      @messages = Message.paginate(:page => params[:page]).order_by_latest
    end    
  end  

  def edit
    @message = current_user.messages.find(params[:id])
  end 

  def update
    @message = current_user.messages.find(params[:id])

    if @message.update_attributes(params[:message])
      @messages = Message.paginate(:page => params[:page]).order_by_latest
    end   
  end   

  def show
    @message = Message.find(params[:id])
    
    respond_to do |format|
      format.js 
    end
  end  

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy
    @messages = Message.paginate(:page => params[:page]).order_by_latest
  end  
end