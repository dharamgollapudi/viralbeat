require 'spec_helper'

describe 'sessions controller' do
	describe 'sign in page' do
  	it 'should have sign in page selector' do
   	 	visit '/users/sign_in'
    	page.should have_selector('#sign_in')
  	end
	end
end