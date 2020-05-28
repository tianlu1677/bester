
$redis = Redis.new(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'], db: ENV['REDIS_CACHE_DB'])
Redis::Objects.redis = $redis