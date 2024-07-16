class AddTextToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :text, :text
  end
end
