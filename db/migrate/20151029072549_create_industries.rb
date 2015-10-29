class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name, null: false
      t.string :name_seo, null: false
      t.integer :parent_id, null: true
      t.integer :lft, null: false
      t.integer :rgt, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :industries, :name
    add_index :industries, :name_seo, unique: true
    add_index :industries, :parent_id
    add_index :industries, :lft
    add_index :industries, :rgt
    add_index :industries, :deleted_at
  end
end
