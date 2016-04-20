class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :document_file
      t.belongs_to :document, null: false
      t.belongs_to :user, null: false
      t.belongs_to :app, null: false
      t.belongs_to :step, null: false
      t.boolean :accepted, null: false, default: false
      t.boolean :ready_for_review, null: false, default: false
      t.boolean :flagged, null: false, default: false

      t.timestamps null: false
    end
    add_index :uploads, [:user_id, :app_id, :step_id, :document_id], unique: true, using: :btree
  end
end
