class CreateBookUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :book_users do |t|
      t.integer :book_id
      t.integer :user_id
      t.date :from
      t.date :to
      t.string :status

      t.timestamps
    end
  end
end
