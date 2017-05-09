class CreateClassdetails < ActiveRecord::Migration
  def change
    create_table :classdetails do |t|
      t.string :cla_id
      t.string :question_id

      t.timestamps null: false
    end
  end
end
