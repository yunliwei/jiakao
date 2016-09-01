class AddLoginToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :login, :string
    add_column :admins, :auth, :string
    add_column :admins, :status, :integer
  end
end
