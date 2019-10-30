class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_email
      t.string :description
      t.string :status
      t.datetime :appointment_time
      t.timestamps
    end
  end
end
