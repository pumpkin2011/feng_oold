class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user_zhao, index: true, foreign_key: true
      t.string :name, null: false
      t.string :mobile, null: false
      t.string :gender, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :contacts, :name
    add_index :contacts, :mobile
    add_index :contacts, :gender
    add_index :contacts, :deleted_at
  end
end
