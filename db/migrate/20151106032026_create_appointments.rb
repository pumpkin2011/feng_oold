class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :job, index: true, foreign_key: true
      t.references :labor, index: true, foreign_key: true
      t.integer :zhao_id
      t.integer :song_id
      t.string :state
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :appointments, :zhao_id
    add_index :appointments, :song_id
    add_index :appointments, :state
  end
end
