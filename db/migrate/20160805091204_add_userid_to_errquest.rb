class AddUseridToErrquest < ActiveRecord::Migration
  def change
    add_column :errquests, :user_id, :integer
    add_column :errquests, :question_id, :integer
  end
end
