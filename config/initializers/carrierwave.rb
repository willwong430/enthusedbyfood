CarrierWave.configure do |config|
  if true
    config.storage = :fog
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    }
    config.fog_directory = ENV["AWS_S3_BUCKET"]
  elsif Rails.env.development?
    config.storage = :file
  else
    config.storage = :file
    config.enable_processing = false
  end
end
