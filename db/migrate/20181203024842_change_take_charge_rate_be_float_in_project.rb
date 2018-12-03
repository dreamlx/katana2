class ChangeTakeChargeRateBeFloatInProject < ActiveRecord::Migration[5.1]
  def change
  	change_column :projects, :charge_rate, :float
  end
end
