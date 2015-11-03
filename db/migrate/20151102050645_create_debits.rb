class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.references :user, index: true, polymorphic: true
      t.references :bank, index: true, foreign_key: true
      t.string :name, null: false
      t.string :account, null: false
      t.string :deposit

      t.timestamps null: false
    end
    add_index :debits, :name
    add_index :debits, :account
  end
end
