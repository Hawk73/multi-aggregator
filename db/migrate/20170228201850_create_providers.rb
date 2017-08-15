class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.integer :user_id, null: false
      t.jsonb :settings, default: {}
      t.string :adapter_type, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :providers, :user_id
    add_index :providers, :name, unique: true
  end
end
