class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :document_name, null: false
      t.text :description
      t.string :completion_status, null: false

      t.timestamps null: false
    end
  end
end
