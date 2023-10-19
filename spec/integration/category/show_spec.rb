require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  let(:user) { User.create(name: 'John Doe', email: 'john@gmail.com', password: '123456') }

  before(:each) do
    category = Category.create(name: 'Food', user: user)
    expense = Expense.create(name: 'Pizza', amount: 10, author: user)
    ExpenseCategory.create(category: category, expense: expense)
    login_as(user, scope: :user)
    visit categories_path
  end

  it 'shows the category name' do
    expect(page).to have_content('Food')
  end

  it 'clicking on the category name should take you to the category show page' do
    click_on('Food')
    expect(page).to have_content('NEW EXPENSE')
  end

  it 'clicking on the new expense button should take you to the new expense page' do
    click_on('Food')
    click_on('NEW EXPENSE')
    expect(page).to have_content('NEW EXPENSE')
  end

  it 'should display the total cost of the expenses' do
    click_on('Food')
    expect(page).to have_content('Total: &nbsp R10.00')
  end

  it 'should display the name of the expense' do
    click_on('Food')
    expect(page).to have_content('Pizza')
  end

  it 'should display the amount of the expense' do
    click_on('Food')
    expect(page).to have_content('R10.00')
  end
end
