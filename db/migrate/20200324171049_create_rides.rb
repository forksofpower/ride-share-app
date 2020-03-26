class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :driver_id
      t.integer :passenger_id
      t.integer :route
      t.string  :start_location
      t.string :destination
      t.float :fare
      t.float :tip
    
      t.timestamps
    end
  end
end
