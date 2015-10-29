class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.references :user_song, index: true, foreign_key: true
      t.string :name, null: false
      t.string :mobile, null: false
      t.string :idcard, null: false
      t.string :gender, null: false
      t.date :birthday, null: false
      t.string :channel, null: false
      t.string :province, null: false
      t.string :city, null: false
      t.string :district, null: false
      t.string :state, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :labors, :name
    add_index :labors, :mobile
    add_index :labors, :idcard
    add_index :labors, :gender
    add_index :labors, :birthday
    add_index :labors, :channel
    add_index :labors, :province
    add_index :labors, :city
    add_index :labors, :district
    add_index :labors, :state
    add_index :labors, :deleted_at
  end
end
