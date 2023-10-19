require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'john@gmail.com', password: '123456')
    @expense = Expense.create(name: 'Pizza', amount: 10, author: @user)
  end

  it 'is valid with valid attributes' do
    expect(@expense).to be_valid
  end

  it 'is not valid without a name' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'is not valid without an amount' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end

  it 'is not valid without an author' do
    @expense.author = nil
    expect(@expense).to_not be_valid
  end
end
