class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.date :date
      t.datetime :start_time
      t.time :time
      t.string :comment
      t.string :basic_services
      t.string :chemical_services
      t.string :color_services
      t.string :weave
      t.string :braids
      t.string :treatment_services
      t.integer :user_id
      t.integer :stylist_id

      t.timestamps
    end
    add_index :appointments, :user_id
    add_index :appointments, :stylist_id
  end
end
