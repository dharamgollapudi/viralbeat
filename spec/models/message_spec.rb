require 'spec_helper'

describe Message do
  it "is not valid without title" do
    Message.create(:title => nil, :body => "message").should_not be_valid
  end

  it "is not valid without body" do
    Message.create(:title => "test", :body => nil).should_not be_valid
  end  

  it "is not valid without the associated user" do
    Message.create(:title => "test", :body => "message").should_not be_valid
  end 

  it "is valid with title, body and the associated user" do
    User.destroy_all
    Message.destroy_all
    user = User.create(
      :email => "test@viralbeat.com",
      :password => "password",
      :password_confirmation => "password"
    )
    user.messages.create(
      :title => "test", 
      :body => "message"
    ).should be_valid
  end      
end
