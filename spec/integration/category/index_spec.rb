require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) { User.create(name: 'John', email: 'test@test.com', password: '121212') }

  before do
    Category.create(name: 'Food', user: user)
    login_as(user, scope: :user)
    visit categories_path
  end

  describe 'When visiting the categories page' do
    it 'displays the categories heading' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'displays the new category button' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'clicking on the new category button should take you to the new category page' do
      click_on('NEW CATEGORY')
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should display category name' do
      expect(page).to have_content('Food')
    end

    it 'should display the total amount spent on the category' do
      expect(page).to have_content('R0.00')
    end

    it 'should display the total amount spent on all categories' do
      expect(page).to have_content('Total: &nbsp R0.00')
    end

    it 'clicking on the category name should take you to the category show page' do
      click_on('Food')
      expect(page).to have_content('NEW EXPENSE')
    end
  end
end
