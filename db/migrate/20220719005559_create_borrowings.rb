class CreateBorrowings < ActiveRecord::Migration[6.1]
  def change
    create_table :borrowings do |t|
      t.string :borrowed_to, null: false
      t.date :borrowed_at, null: false
      t.date :returned_at
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
