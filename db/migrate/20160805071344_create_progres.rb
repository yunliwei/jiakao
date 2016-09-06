class CreateProgres < ActiveRecord::Migration
  def change
    create_table :progres do |t|

      t.timestamps null: false
    end
  end
end
