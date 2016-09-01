class AddAttachmentQuestionimageToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :questionimage
    end
  end

  def self.down
    remove_attachment :questions, :questionimage
  end
end
