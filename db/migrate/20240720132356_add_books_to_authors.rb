class AddBooksToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_reference :authors, :book, null: true, foreign_key: true
  end
end
