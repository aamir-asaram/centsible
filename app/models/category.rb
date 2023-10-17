class Category < ApplicationRecord
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories
  has_one_attached :icon

  validates :name, presence: true, uniqueness: true

  def total
    expenses.sum(:amount)
  end
end
