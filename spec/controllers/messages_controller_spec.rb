require 'spec_helper'

describe 'messages controller' do
  describe 'index page' do
    it 'should have message list page selector' do
      visit '/messages'
      page.should have_selector('#message_list')
    end

    it 'should display no messages if there are no messages in the system' do
      Message.delete_all 
      visit '/messages'
      page.should have_content('No Messages')
    end

    it 'should have message id selection' do
      User.destroy_all
      Message.destroy_all      
      user = User.create(
        :email => 'test@viralbeat.com',
        :password => 'password',
        :password_confirmation => 'password'
      )
      message = user.messages.create(
        :title => "test title",
        :body => "test body"
      )
      visit '/messages'
      page.should have_selector("#message_#{message.id}")
    end
  end
end