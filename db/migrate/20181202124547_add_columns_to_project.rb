class AddColumnsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :contract_amount, :integer
    add_column :projects, :memo, :text
  end
end
