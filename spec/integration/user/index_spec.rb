require 'rails_helper'

RSpec.describe 'Splash screen', type: :feature do
  describe 'Testing integration specs for users index page' do
    before do
      visit '/'
    end

    it 'should display the splash screen' do
      expect(page).to have_content('Centsible')
    end

    it 'clicking on the sign up button should take you to the sign up page' do
      click_on('Sign Up')
      expect(page).to have_content('Sign up')
    end

    it 'clicking on the log in button should take you to the log in page' do
      click_on('Log In')
      expect(page).to have_content('Login')
    end

    it 'signing up should take you to the categories index page' do
      click_on('Sign Up')
      fill_in('Full name', with: 'John')
      fill_in('Email', with: 'john@gmail.com')
      fill_in('Password', with: '121212')
      fill_in('Confirm Password', with: '121212')
      click_on('Sign Up')
      expect(page).to have_content('CATEGORIES')
    end
  end
end