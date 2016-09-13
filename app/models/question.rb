class Question < ActiveRecord::Base
  before_update :randomize_questionimage
  before_update :randomize_voice
  has_many :answers,dependent: :destroy
  has_many :errquests
  has_many :progres
  has_many :chapters
  has_many :subjects
  has_attached_file :questionimage, :url => "/:attachment/:basename.:extension",  :path => ":rails_root/public/:attachment/:basename.:extension"
  #uuidimagename=UUIDTools::UUID.timestamp_create
  #has_attached_file :questionimage, :url => "/:attachment/"+uuidimagename+".:extension",  :path => ":rails_root/public/:attachment/"+uuidimagename+".:extension"
  do_not_validate_attachment_file_type :questionimage
  has_attached_file :voice, :url => "/:attachment/:basename.:extension",  :path => ":rails_root/public/:attachment/:basename.:extension"

  do_not_validate_attachment_file_type :voice
  #validates_attachment_content_type :voice,  :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ], :allow_nil => true
  #validates_attachment_content_type :voice, :content_type => 'audio/mpeg'
  #validates_attachment_content_type :voice,:content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],:allow_nil => true








  private
  def randomize_questionimage
    #archives 就是你在 has_attached_file :archives 使用的名字
    if questionimage_file_name != nil
      extension = File.extname(questionimage_file_name).downcase
      #你可以改成你想要的文件名，把下面这个方法的第二个参数随便改了就可以了。
      self.questionimage.instance_write(:file_name, "#{questionimage.instance.id}#{extension}")
    end
  end

  def randomize_voice
    if voice_file_name != nil
      #archives 就是你在 has_attached_file :archives 使用的名字
      extension = File.extname(voice_file_name).downcase
      #你可以改成你想要的文件名，把下面这个方法的第二个参数随便改了就可以了。
      self.voice.instance_write(:file_name, "#{voice.instance.id}#{extension}")
    end
  end





end
