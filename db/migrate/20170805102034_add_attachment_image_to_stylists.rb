class AddAttachmentImageToStylists < ActiveRecord::Migration[5.1]
  def self.up
    change_table :stylists do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :stylists, :image
  end
end
