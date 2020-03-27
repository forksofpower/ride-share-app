class AddEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :name
      t.string :location
      t.string :venue_name

      t.timestamps
    end
  end
end
