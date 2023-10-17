# frozen_string_literal: true

class ChangeDefaultIconUrl < ActiveRecord::Migration[7.0]
  def up
    Category.where(icon: 'your_default_url').update_all(icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconsdb.com%2Fwhite-icons%2Fsquare-icon.html&psig=AOvVaw0KaYFtvDmI6PWoIPQn0_k5&ust=1697627127182000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLDc5YD4_IEDFQAAAAAdAAAAABAR')
  end

  def down
    Category.where(icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconsdb.com%2Fwhite-icons%2Fsquare-icon.html&psig=AOvVaw0KaYFtvDmI6PWoIPQn0_k5&ust=1697627127182000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLDc5YD4_IEDFQAAAAAdAAAAABAR').update_all(icon: 'your_default_url')
  end
end
