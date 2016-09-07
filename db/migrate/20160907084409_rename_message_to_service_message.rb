class RenameMessageToServiceMessage < ActiveRecord::Migration[5.0]
  def change
    rename_table :messages, :service_messages
  end
end
