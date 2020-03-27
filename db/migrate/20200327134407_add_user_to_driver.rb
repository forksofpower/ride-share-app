class AddUserToDriver < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :user, :integer
  end
end
