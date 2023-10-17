# frozen_string_literal: true

class RemoveIconNullConstraintFromCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string, null: true
  end
end
