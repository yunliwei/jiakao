class AddAttachmentVoiceToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :voice
    end
  end

  def self.down
    remove_attachment :questions, :voice
  end
end
