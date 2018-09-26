class SignedUrlsController < ApplicationController
  def index
    render json: {
      policy: s3_upload_policy_document,
      :'X-Amz-Signature' => s3_upload_signature,
      key: "uploads/#{SecureRandom.uuid}/#{params[:doc][:title]}",
      success_action_redirect: "/"
    }
  end

  private

  def s3_upload_policy_document
    Base64.encode64(
      {
        expiration: 30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z'),
        conditions: [
          { bucket: ENV['AWS_S3_BUCKET'] },
          ["starts-with", "$key", "uploads/"],
          { acl: 'public-read' },
          { success_action_status: '201' },
          {:'x-amz-credential' => "AKIAIN4ZPUQJIFDBZ7OA/20180925/us-east-1/s3/aws4_request"},
          {:'x-amz-algorithm' => "AWS4-HMAC-SHA256"},
          {:'x-amz-date' => "20180925T000000Z" }
        ]
      }.to_json
    ).gsub(/\n|\r/, '')
  end

  def getSignatureKey key, dateStamp, regionName, serviceName
    kDate = OpenSSL::HMAC.digest('sha256', "AWS4" + key, dateStamp)
    kRegion = OpenSSL::HMAC.digest('sha256', kDate, regionName)
    kService = OpenSSL::HMAC.digest('sha256', kRegion, serviceName)
    kSigning = OpenSSL::HMAC.digest('sha256', kService, "aws4_request")
    kSigning
  end


  def s3_upload_signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        getSignatureKey(ENV['AWS_SECRET_ACCESS_KEY'], '20180925', 'us-east-1', 's3'),
        s3_upload_policy_document
      )
    ).gsub(/\n/, '')
  end
end

