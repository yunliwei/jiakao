class AddIsnewToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :isnew, :integer
  end
end
