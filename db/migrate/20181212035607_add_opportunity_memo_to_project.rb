class AddOpportunityMemoToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :opportunity_memo, :text
  end
end
