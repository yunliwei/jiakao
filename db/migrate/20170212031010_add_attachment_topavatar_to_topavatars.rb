class AddAttachmentTopavatarToTopavatars < ActiveRecord::Migration
  def self.up
    change_table :topavatars do |t|
      t.attachment :topavatar
    end
  end

  def self.down
    remove_attachment :topavatars, :topavatar
  end
end
