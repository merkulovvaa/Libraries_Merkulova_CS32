class CreateBooksReaderCards < ActiveRecord::Migration[7.0]
  def change
    create_table :book_reader_cards do |t|
      t.references :book, null: false, foreign_key: true
      t.references :reader_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
