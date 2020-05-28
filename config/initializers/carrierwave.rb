CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|  
  config.qiniu_style_inline = true 
  case ENV['UPLOAD_PROVIDER']
  when 'aliyun'
    config.storage = :aliyun
    config.aliyun_access_id  = ENV['UPLOAD_ACCESS_KEY']
    config.aliyun_access_key = ENV['UPLOAD_SECKET_KEY']
    config.aliyun_bucket     = ENV['UPLOAD_BUCKET']
    config.aliyun_internal   = ENV['UPLOAD_ALIYUN_INTERNAL']
    config.aliyun_area       = ENV['UPLOAD_ALIYUN_AREA']
    config.aliyun_host       = ENV['UPLOAD_BUCKET_DOMAIN']
  when 'qiniu'
    config.storage              = :qiniu
    config.qiniu_access_key     = ENV['UPLOAD_ACCESS_KEY']
    config.qiniu_secret_key     = ENV['UPLOAD_SECKET_KEY']
    config.qiniu_bucket         = ENV['UPLOAD_BUCKET']
    config.qiniu_bucket_domain  = ENV['UPLOAD_BUCKET_DOMAIN']
    config.qiniu_bucket_private = false #default is false
    config.qiniu_block_size     = 4*1024*1024
    # config.qiniu_protocol       = ENV['qiniu_protocol']
    # config.qiniu_up_host        = 'http://up.qiniug.com' #七牛上传海外服务器,国内使用可以不要这行配置
  else
    config.storage = :file
  end

  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
end