class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :job_id
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :state, null: false
      t.text :text, null: false

      t.timestamps
    end

    add_index :requests, :user_id
    add_index :requests, :name, unique: true
  end
end
