class AddActiveStageToApps < ActiveRecord::Migration[5.0]
  def change
    add_column :apps, :active_stage, :integer, null: false, default: 1
  end
end
