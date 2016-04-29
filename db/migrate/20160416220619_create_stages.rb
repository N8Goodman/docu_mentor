class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :stage_name, null: false
      t.text :description
      t.string :completion_status, null: false, default: "Approved"

      t.timestamps null: false
    end
  end
end
