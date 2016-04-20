class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.belongs_to :app, null: false
      t.belongs_to :user, null: false
      t.belongs_to :stage, null: false
      t.boolean :accepted, null: false, default: false
      t.boolean :ready_for_review, null: false, default: false

      t.timestamps null: false
    end
    add_index :steps, [:user_id, :app_id, :stage_id], unique: true, using: :btree
  end
end
