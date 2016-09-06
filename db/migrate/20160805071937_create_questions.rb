class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :questionname
      t.string :isjudge
      t.string :driverlicensetype
      t.string :questiontype

      t.timestamps null: false
    end
  end
end
