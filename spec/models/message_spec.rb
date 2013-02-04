require 'spec_helper'

describe Message do
  it "is not valid without title" do
    Message.create().should_not be_valid
  end
end
