class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.string :name_seo, null: false
      t.integer :parent_id, null: true
      t.integer :lft, null: false
      t.integer :rgt, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :positions, :name
    add_index :positions, :name_seo, unique: true
    add_index :positions, :parent_id
    add_index :positions, :lft
    add_index :positions, :rgt
    add_index :positions, :deleted_at
  end
end
