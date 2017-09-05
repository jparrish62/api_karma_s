class CreateStylists < ActiveRecord::Migration[5.1]
  def change
    create_table :stylists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :bio
      t.integer :user_id

      t.timestamps
    end
    add_index :stylists, :user_id
  end
end
