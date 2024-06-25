class AddStatusToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :status, :boolean, default: true, null: false
  end
end
