class AddIconToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :icon_id, :integer, default: 5
  end
end
