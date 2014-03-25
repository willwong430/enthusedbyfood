# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end
  
  def cache_dir
    "{Rails.root}/tmp/uploads"
  end
  
  version :standard do
    process :resize_to_limit => [400, 400]
  end

  version :thumbnail do
    process :resize_to_limit => [220, 280]
  end
  
  version :avatar do
    process :resize_to_limit => [50,50]
  end
end
