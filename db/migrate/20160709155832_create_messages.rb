class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :friend_id
      t.text    :message
      t.string  :problem
      t.string  :name
      t.string  :email
      t.string  :phone

      t.timestamps null: false
    end
  end
end
