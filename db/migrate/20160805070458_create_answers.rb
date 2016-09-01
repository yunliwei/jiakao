class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :asnwer
      t.integer :isright

      t.timestamps null: false
    end
  end
end
