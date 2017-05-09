class AddAdminidToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_id, :integer
  end
end
