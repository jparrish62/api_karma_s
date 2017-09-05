class AddProfilePicToStylist < ActiveRecord::Migration[5.1]
  def change
    add_column :stylists, :profile_pic, :string
  end
end
