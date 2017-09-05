class AddUserIdToImagePortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :image_portfolios, :user_id, :integer
    add_index :image_portfolios, :user_id
  end
end
