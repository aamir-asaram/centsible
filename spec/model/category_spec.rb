require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'john@gmail.com', password: '123456')
    @category = Category.create(name: 'Food', user: @user)
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without a user' do
    @category.user = nil
    expect(@category).to_not be_valid
  end
end
