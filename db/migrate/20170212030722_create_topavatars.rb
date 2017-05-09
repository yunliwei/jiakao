class CreateTopavatars < ActiveRecord::Migration
  def change
    create_table :topavatars do |t|

      t.timestamps null: false
    end
  end
end
