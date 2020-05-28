# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include ImageHelper

  # Choose what kind of storage to use for this uploader:
  if Rails.env.development?
    storage :file
    #storage :qiniu
  else
    storage (ENV['UPLOAD_PROVIDER'] || 'qiniu').to_sym
  end

  # self.qiniu_bucket                = "avatars"
  # self.qiniu_bucket_domain         = "avatars.files.example.com"
  # self.qiniu_protocal              = 'http'
  # self.qiniu_delete_after_days     = 30
  # self.qiniu_can_overwrite = true
  # self.qiniu_bucket_private        = true #default is false
  # self.qiniu_callback_url          = "http://<ip1>/callback;http://<ip2>/callback"
  # self.qiniu_callback_body         = "key=$(key)&hash=$(etag)&w=$(imageInfo.width)&h=$(imageInfo.height)" # see http://developer.qiniu.com/docs/v6/api/overview/up/response/vars.html#magicvar
  # self.qiniu_persistent_notify_url = "http://<ip>/notify"

  def store_dir
    "uploads/#{model.class.to_s.underscore}/"
  end

  # use_qiniu_styles thumb: 'imageView2/0/w/100/h/100/interlace/1/q/90|imageslim',
                  #  medium: 'imageView2/0/h/200/interlace/1/q/90|imageslim',
                  #  fix: 'imageView2/0/interlace/1/q/90|imageslim',
                  #  video_thumb: 'vframe/jpg/offset/5/h/100'

  def filename
    if original_filename.present?
      file_type = File.extname(original_filename.downcase)
      filename = Digest::MD5.hexdigest(original_filename.downcase)
      "#{Time.now.strftime('%Y%m%d%H%M')}P#{filename}#{file_type}"
    end
  end
end
