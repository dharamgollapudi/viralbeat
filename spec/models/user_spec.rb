require 'spec_helper'

describe User do
  it 'deleting a user should destroy the associated messages' do
    User.destroy_all
    Message.destroy_all
    user = User.create(
      :email => "test@viralbeat.com",
      :password => "password",
      :password_confirmation => "password"
    )
    message = user.messages.create(
      :title => "test", 
      :body => "message"
    ) 
    User.count.should == 1
    Message.count.should == 1
    user.destroy
    User.count.should == 0
    Message.count.should == 0
  end
end
