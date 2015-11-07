class AddQuantityAndAppointmentsCountToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :quantity, :integer, null: false
    add_column :jobs, :appointments_count, :integer
  end
end
