class AddLocationToLoginlog < ActiveRecord::Migration
  def change
    add_column :loginlogs, :location, :string
  end
end
