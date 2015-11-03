class CreateCashOuts < ActiveRecord::Migration
  def change
    create_table :cash_outs do |t|
      t.references :enterprise, index: true
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :serial_inner, null: false
      t.string :serial_outer
      t.string :state, null: false
      t.string :note
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
