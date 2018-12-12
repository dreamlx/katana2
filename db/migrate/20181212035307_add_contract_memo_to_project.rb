class AddContractMemoToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :contract_memo, :text
  end
end
