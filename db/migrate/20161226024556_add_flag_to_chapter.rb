class AddFlagToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :flag, :string
  end
end
