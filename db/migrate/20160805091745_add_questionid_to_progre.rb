class AddQuestionidToProgre < ActiveRecord::Migration
  def change
    add_column :progres, :question_id, :integer
  end
end
