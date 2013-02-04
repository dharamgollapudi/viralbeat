require 'spec_helper'

describe 'messages controller' do
  describe 'index page' do
    it 'should have message list page selector' do
      visit '/messages'
      page.should have_selector('#message_list')
    end
  end
end