class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user_zhao, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age_min, null: false
      t.integer :age_max, null: false
      t.integer :salary_basic, null: false
      t.integer :salary_min, null: false
      t.integer :salary_max, null: false
      t.string :state, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :jobs, :name
    add_index :jobs, :gender
    add_index :jobs, :age_min
    add_index :jobs, :age_max
    add_index :jobs, :salary_basic
    add_index :jobs, :salary_min
    add_index :jobs, :salary_max
    add_index :jobs, :state
    add_index :jobs, :deleted_at
  end
end
