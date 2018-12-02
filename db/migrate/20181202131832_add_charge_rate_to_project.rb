class AddChargeRateToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :charge_rate, :integer
  end
end
