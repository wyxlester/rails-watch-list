class ChangeReferenceTypeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :bookmarks, :movie_id, :integer
    change_column :bookmarks, :list_id, :integer
  end
end
