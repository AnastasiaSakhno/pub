class BasicUploader < CarrierWave::Uploader::Base

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
