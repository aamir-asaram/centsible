class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :destroy
  has_many :categories, through: :expense_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def user_expenses(user)
    where(author: user)
  end

end
