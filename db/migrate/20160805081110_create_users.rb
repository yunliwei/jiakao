class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :head
      t.string :studentid
      t.string :sex
      t.integer :age
      t.string :idcard
      t.string :name
      t.string :money
      t.string :model
      t.string :Subject
      t.string :logintype
      t.integer :loginnumber
      t.string :logintime
      t.string :status

      t.timestamps null: false
    end
  end
end
