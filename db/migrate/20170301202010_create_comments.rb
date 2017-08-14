class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :snippet_id
      t.text :text, null: false

      t.timestamps
    end

    add_index :comments, :snippet_id
  end
end
