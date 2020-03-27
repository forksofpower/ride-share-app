require 'bundler'
require 'faker'

Bundler.require

# setup database
ActiveRecord::Base.establish_connection(
    :adapter    => 'sqlite3', 
    :database   => 'db/development.db'
)
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = 1
# config.active_record.logger = nil

require_all 'lib'