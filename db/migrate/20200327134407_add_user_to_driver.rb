class AddUserToDriver < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :user_id, :integer
  end
end