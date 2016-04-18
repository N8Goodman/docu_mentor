class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.belongs_to :procedure, null: false
      t.belongs_to :stage, null: false

      t.timestamps null: false
    end
  end
end
