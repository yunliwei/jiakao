class CreateLoginlogs < ActiveRecord::Migration
  def change
    create_table :loginlogs do |t|
      t.integer :user_id
      t.string :ip

      t.timestamps null: false
    end
  end
end
