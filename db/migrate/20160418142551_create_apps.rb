class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.belongs_to :user, null: false
      t.belongs_to :procedure, null: false
      t.string :status, null: false, default: "Open"
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
    add_index :apps, [:procedure_id, :user_id], unique: true, using: :btree
  end
end
