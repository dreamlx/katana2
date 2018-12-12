class AddOpportunityAmountToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :opportunity_amount, :integer
  end
end
