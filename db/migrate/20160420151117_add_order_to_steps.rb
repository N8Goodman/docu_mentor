class AddOrderToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :order, :integer, null: false
  end
end
