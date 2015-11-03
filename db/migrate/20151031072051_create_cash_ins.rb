class CreateCashIns < ActiveRecord::Migration
  def change
    create_table :cash_ins do |t|
      t.references :enterprise, index: true
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :serial_inner, null: false
      t.string :serial_outer
      t.string :channel, null: false
      t.string :state, null: false
      t.string :note

      t.timestamps null: false
    end

    add_index :cash_ins, :serial_inner, unique: true
    add_index :cash_ins, :serial_outer, unique: true
    add_index :cash_ins, :channel
    add_index :cash_ins, :state
  end
end
