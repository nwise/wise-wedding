class Page < ActiveRecord::Base
  has_many :page_versions
  #has_many :page_images
  before_save :set_url_tag

#  mount_uploader :ckeditor_attachment_file_uploader, CkeditorAttachmentFileUploader
  
  acts_as_versioned
  validates_presence_of :title, :content

  scope :published, :conditions => ['published=?', true]

  def set_url_tag   
    self.url_tag = self.title.gsub(/[^a-z0-9]+/i, '-').downcase if self.url_tag.blank?
  end

end
