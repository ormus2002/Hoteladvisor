# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

  CarrierWave::SanitizedFile.sanitize_regexp = /[^a-zA-Zа-яА-ЯёЁ0-9\.\_\-\+\s\:]/
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/images/hotels/#{version_name}"
  end

  process :resize_to_limit => [800, 800]

  def filename
    @name ||= "#{model.hotel.id}_#{timestamp}.#{model.image_file.file.extension}" if original_filename.present?
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end

  version :thumb do
    process :resize_to_limit => [60, 60]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
