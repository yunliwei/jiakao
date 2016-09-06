class CreateUpdatechecks < ActiveRecord::Migration
  def change
    create_table :updatechecks do |t|
      t.string :updatecheck

      t.timestamps null: false
    end
  end
end
