class Image < ActiveRecord::Base
  before_create :default_name
  belongs_to :hotel
  mount_uploader :image_file, FileUploader
  scope :desc, -> { order("created_at DESC") }

  def default_name
    self.name ||= File.basename(image_file.filename) if image_file
  end
end
