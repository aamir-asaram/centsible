# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.string :icon, null: false
      t.timestamps
    end
  end
end
