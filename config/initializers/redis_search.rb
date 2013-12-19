#require "redis"
#require "redis-namespace"
#require "redis-search"
## don't forget change namespace
#redis = Redis.new(:host => "127.0.0.1",:port => "6379")
## We suggest you use a special db in Redis, when you need to clear all data, you can use flushdb command to clear them.
#redis.select(3)
## Give a special namespace as prefix for Redis key, when your have more than one project used redis-search, this config will make them work fine.
#redis = Redis::Namespace.new("your_app_name:redis_search", :redis => redis)
#Redis::Search.configure do |config|
#  config.redis = redis
#  config.complete_max_length = 100
#  config.pinyin_match = true
#  # use rmmseg, true to disable it, it can save memroy
#  config.disable_rmmseg = false
#
#  ActiveRecord::Base.connection.tables.map do |model|
#    _name = model.capitalize.singularize.camelize
#    if  Kernel.class_defined?(_name)
#      _class=eval _name
#      _class.new if _class.respond_to?(:redis_search_index)
#    end
#  end
#
#  module Kernel
#    def class_defined?(class_name)
#      begin
#        return self.const_get(class_name).is_a?(Class)
#      rescue NameError
#        return false
#      end
#    end
#  end
#
#end