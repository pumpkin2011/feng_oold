class CreateManagementFees < ActiveRecord::Migration
  def change
    create_table :management_fees do |t|
      t.references :job, index: true, foreign_key: true
      t.integer :amount, null: false
      t.integer :months, null: false
      t.integer :day, null: false
      t.integer :deadline, null: false

      t.timestamps null: false
    end
  end
end
