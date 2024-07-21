class AddDeletedAtToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :deleted_at, :datetime
  end
end
