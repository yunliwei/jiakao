class AddAttachmentLeftavatarToLeftavatars < ActiveRecord::Migration
  def self.up
    change_table :leftavatars do |t|
      t.attachment :leftavatar
    end
  end

  def self.down
    remove_attachment :leftavatars, :leftavatar
  end
end
