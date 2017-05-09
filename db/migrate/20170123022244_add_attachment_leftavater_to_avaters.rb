class AddAttachmentLeftavaterToAvaters < ActiveRecord::Migration
  def self.up
    change_table :avaters do |t|
      t.attachment :leftavater
    end
  end

  def self.down
    remove_attachment :avaters, :leftavater
  end
end
