class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.integer :job_id
      t.text :text, null: false
      t.string :state, null: false

      t.timestamps
    end

    add_index :requests, [:user_id, :job_id], unique: true
  end
end
