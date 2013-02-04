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
end
