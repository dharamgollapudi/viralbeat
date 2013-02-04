require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

describe 'messages controller' do
  before(:each) do
    User.destroy_all
    @user = User.create(
              :email => 'test@viralbeat.com',
              :password => 'password',
              :password_confirmation => 'password'
            )
    login_as @user, :scope => :user
  end

  after(:each) do
    Warden.test_reset!
  end

  describe 'index page' do
    # it 'should have message list page selector' do
    #   visit messages_path
    #   page.should have_selector('#message_list')
    # end

    # it 'should display no messages if there are no messages in the system' do
    #   Message.delete_all 
    #   visit messages_path
    #   page.should have_content('No Messages')
    # end

    # it 'should have message id selection' do
    #   message = @user.messages.create(
    #     :title => "test title",
    #     :body => "test body"
    #   )
    #   visit '/messages'
    #   page.should have_selector("#message_#{message.id}")
    # end

    # it 'lets the user post a message', :js => true do
    #   Message.delete_all 
    #   visit messages_path
    #   page.should have_selector('#message_new')
    #   click_button "message_new"
    #   page.should have_selector('#message_form', :visible => true)
    #   page.should have_content('Submit a Posting')
    #   fill_in 'message[title]', :with => 'Test Title'
    #   fill_in 'message[body]', :with => 'Test Body'
    #   click_on 'Submit'
    #   page.should have_content('Test Title')
    # end 

    # it 'lets the user to edit a message', :js => true do
    #   Message.delete_all 
    #   message = @user.messages.create(
    #     :title => "test title",
    #     :body => "test body"
    #   )    
    #   visit messages_path
    #   page.should have_selector("#edit_message_#{message.id}")
    #   click_link "edit_message_#{message.id}"
    #   page.should have_selector('#message_form', :visible => true)
    #   fill_in 'message[title]', :with => 'Test Title (updated)'  
    #   fill_in 'message[body]', :with => 'Test Body (updated)'
    #   click_on 'Update'
    #   page.should have_content('Test Title (updated)')
    # end  

    it 'lets the user look at the detail view of a message', :js => true do
      Message.delete_all 
      message = @user.messages.create(
        :title => "Test Title",
        :body => "Test Body"
      )    
      visit messages_path
      page.should have_selector("#detail_message_#{message.id}")
      click_link "detail_message_#{message.id}"
      page.should have_selector("#message_detail_#{message.id}", :visible => true)
      page.should have_content('Test Title')
      page.should have_content('Test Body')      
    end        
  end
end