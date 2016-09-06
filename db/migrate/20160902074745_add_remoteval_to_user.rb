class AddRemotevalToUser < ActiveRecord::Migration
  def change
    add_column :users, :remoteval, :string
  end
end
