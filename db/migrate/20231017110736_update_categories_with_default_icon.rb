class UpdateCategoriesWithDefaultIcon < ActiveRecord::Migration[7.0]
  def up
    Category.where(icon: nil).update_all(icon: 'your_default_url')
  end

  def down
    Category.where(icon: 'your_default_url').update_all(icon: nil)
  end
end
