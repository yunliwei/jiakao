class AddEducationToUser < ActiveRecord::Migration
  def change
    add_column :users, :education, :string
    add_column :users, :phonenumber, :string
    add_column :users, :part, :string
  end
end
