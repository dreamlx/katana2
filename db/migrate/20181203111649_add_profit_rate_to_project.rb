class AddProfitRateToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :profit_rate, :integer
  end
end
