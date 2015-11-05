class CreateRecruitmentFees < ActiveRecord::Migration
  def change
    create_table :recruitment_fees do |t|
      t.references :job, index: true, foreign_key: true
      t.string :gender, null: false
      t.integer :days, null: false
      t.integer :amount, null: false
      t.integer :deadline, null: false

      t.timestamps null: false
    end
  end
end
