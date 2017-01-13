class CreateClas < ActiveRecord::Migration
  def change
    create_table :clas do |t|
      t.integer :chapter_id
      t.integer :subject_id
      t.string :classflag
      t.string :questiontype
      t.string :name

      t.timestamps null: false
    end
  end
end
