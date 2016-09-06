class CreateErrquests < ActiveRecord::Migration
  def change
    create_table :errquests do |t|
      t.integer :amount

      t.timestamps null: false
    end
  end
end
