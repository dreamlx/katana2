class AddRiskRateToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :risk_rate, :integer
  end
end
