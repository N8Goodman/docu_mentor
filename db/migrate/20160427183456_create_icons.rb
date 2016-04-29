class CreateIcons < ActiveRecord::Migration[5.0]
  def change
    create_table :icons do |t|
      t.string :name, null: false
      t.string :icon_img, null: false
    end
  end
end
