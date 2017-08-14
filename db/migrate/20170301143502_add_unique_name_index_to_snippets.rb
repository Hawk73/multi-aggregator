class AddUniqueNameIndexToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_index :snippets, :name, unique: true
  end
end
