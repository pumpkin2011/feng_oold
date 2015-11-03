class AddDeletedAtToCashIn < ActiveRecord::Migration
  def change
    add_column :cash_ins, :deleted_at, :datetime
    add_index :cash_ins, :deleted_at
  end
end
