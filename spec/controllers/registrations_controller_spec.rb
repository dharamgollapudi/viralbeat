require 'spec_helper'

describe 'registrations controller' do
	describe 'sign up page' do
  	it 'should have sign up page selector' do
   	 	visit '/users/sign_up'
    	page.should have_selector('#sign_up')
  	end
	end
end