require 'carrierwave/processing/mime_types'

class BasicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes

  process :set_content_type

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  def cache_dir
    Rails.root.join 'tmp/uploads'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
