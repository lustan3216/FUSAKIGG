class AddAttachmentAssetToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :products, :asset
  end
end
