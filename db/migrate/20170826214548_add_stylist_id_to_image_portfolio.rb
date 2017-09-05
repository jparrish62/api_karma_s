class AddStylistIdToImagePortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :image_portfolios, :stylist_id, :integer
    add_index :image_portfolios, :stylist_id
  end
end
