class AddFacebookAuthToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_uid, :string
    add_column :users, :fb_token, :string
    add_column :users, :fb_raw_data, :text
    add_column :users , :authentication_token , :string
    add_column :users, :fb_pic, :string
    add_column :users, :time_zone, :string
    add_index :users, :fb_uid
  end
end
