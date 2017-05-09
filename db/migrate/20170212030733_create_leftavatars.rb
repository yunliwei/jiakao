class CreateLeftavatars < ActiveRecord::Migration
  def change
    create_table :leftavatars do |t|

      t.timestamps null: false
    end
  end
end
