class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.string :name, null: false
      t.text :description
      t.string :completion_status, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
  end
end
