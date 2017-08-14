class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :adapter_type, null: false
      t.jsonb :settings, default: {}

      t.timestamps
    end

    add_index :providers, :user_id
    add_index :providers, [:user_id, :name], unique: true
  end
end
