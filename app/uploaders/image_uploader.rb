# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  version :standard do
    process :resize_to_limit => [400, 400]
  end
  
  # version :standard do
  #     process :resize_to_fill => [100, 150, :north]
  #   end
  #   
  version :thumbnail do
    process :resize_to_limit => [220, 280]
  end
  
  version :avatar do
    process :resize_to_limit => [50,50]
  end
end
