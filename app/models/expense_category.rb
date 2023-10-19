class ExpenseCategory < ApplicationRecord
  belongs_to :expense
  belongs_to :category, dependent: :destroy
end
