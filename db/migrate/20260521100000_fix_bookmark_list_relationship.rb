class FixBookmarkListRelationship < ActiveRecord::Migration[8.1]
  def change
    # Remove the incorrect bookmark_id from lists
    remove_foreign_key :lists, :bookmarks
    remove_column :lists, :bookmark_id

    # Add proper foreign key constraint to list_id in bookmarks
    add_foreign_key :bookmarks, :lists
    change_column_null :bookmarks, :list_id, false
  end
end
