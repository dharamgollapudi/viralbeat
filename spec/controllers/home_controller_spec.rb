require 'spec_helper'

describe 'home controller' do
  it 'should have home page selector' do
    visit '/'
    page.should have_selector('#home_page')
  end
end