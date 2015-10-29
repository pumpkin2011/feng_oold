class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.string :uri, null: false
      t.string :domain, null: false
      t.datetime :published_at
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
