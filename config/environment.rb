require 'bundler'
require 'faker'

Bundler.require

# setup database
ActiveRecord::Base.establish_connection(
    :adapter    => 'sqlite3', 
    :database   => 'db/development.db'
)

require_all 'lib'