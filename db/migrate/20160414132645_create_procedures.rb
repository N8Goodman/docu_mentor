class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.string :procedure_name, null: false
      t.text :description
      t.string :completion_status, null: false, default: "Complete"

      t.timestamps null: false
    end
  end
end
