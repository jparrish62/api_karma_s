class CreateImagePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :image_portfolios do |t|
      t.string :image
      t.string :tittle
      t.string :caption

      t.timestamps
    end
  end
end
