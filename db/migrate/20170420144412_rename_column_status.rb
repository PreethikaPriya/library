class RenameColumnStatus < ActiveRecord::Migration[5.0]
  def change
  	remove_column :book_users, :status
  	add_column :book_users, :status_id, :integer
  end
end
