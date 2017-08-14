class CreateSnippets < ActiveRecord::Migration[5.0]
  def change
    create_table :snippets do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :text
      t.jsonb :settings, default: {}

      t.timestamps
    end

    add_index :snippets, :user_id
  end
end
