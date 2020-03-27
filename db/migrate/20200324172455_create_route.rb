class CreateRoute < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :path
      t.integer :ride_id
    end
  end
end
