class AddAttachmentTopavaterToAvaters < ActiveRecord::Migration
  def self.up
    change_table :avaters do |t|
      t.attachment :topavater
    end
  end

  def self.down
    remove_attachment :avaters, :topavater
  end
end
