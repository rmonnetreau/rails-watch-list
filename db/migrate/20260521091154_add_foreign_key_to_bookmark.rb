class AddForeignKeyToBookmark < ActiveRecord::Migration[8.1]
  def change
    add_column :bookmarks, :list_id, :integer
  end
end
