class AddChapteridToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :chapter_id, :integer
    add_column :questions, :subject_id, :integer
  end
end
