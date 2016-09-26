class ChangeDateFormatUserFbToken < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :fb_token,  :text
  end
end
