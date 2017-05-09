class CreateAvaters < ActiveRecord::Migration
  def change
    create_table :avaters do |t|

      t.timestamps null: false
    end
  end
end
