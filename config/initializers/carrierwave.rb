CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AKIAJHXUXGZ26KODSPBQ"],
    aws_secret_access_key: ENV["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"]
  }
  config.fog_directory = ENV["EnthusedByFood"]
end
