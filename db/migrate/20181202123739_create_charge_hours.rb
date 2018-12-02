class CreateChargeHours < ActiveRecord::Migration[5.1]
  def change
    create_table :charge_hours do |t|
      t.integer :take_time
      t.integer :project_id

      t.timestamps
    end
  end
end
