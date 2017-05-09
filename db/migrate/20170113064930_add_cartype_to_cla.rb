class AddCartypeToCla < ActiveRecord::Migration
  def change
    add_column :clas, :cartype, :string
  end
end
