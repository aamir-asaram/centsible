require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'john@gmail.com', password: '123456')
    @category = Category.create(name: 'Food', user: @user)
    @expense = Expense.create(name: 'Pizza', amount: 10, author: @user)
    @expense_category = ExpenseCategory.create(category: @category, expense: @expense)
  end

  it 'is valid with valid attributes' do
    expect(@expense_category).to be_valid
  end

  it 'is not valid without a category' do
    @expense_category.category = nil
    expect(@expense_category).to_not be_valid
  end

  it 'is not valid without an expense' do
    @expense_category.expense = nil
    expect(@expense_category).to_not be_valid
  end
end
