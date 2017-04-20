class AddColumnBorrowedCount < ActiveRecord::Migration[5.0]
  def change
  	add_column :books, :borrowed_count, :integer
  end
end
