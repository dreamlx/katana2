class ChangeTakeTimeToBeFloatInChargeHour < ActiveRecord::Migration[5.1]
  def change
  	change_column :charge_hours, :take_time, :float
  end
end
