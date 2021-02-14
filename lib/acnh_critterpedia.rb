require 'httparty'
require 'require_all'
require 'terminal-table'
require 'colorize'
require 'sqlite3'

DB = {:conn => SQLite3::Database.new("db/critters.db")}

require 'acnh_critterpedia/version'
require_all 'lib/acnh_critterpedia'

module AcnhCritterpedia
  class Error < StandardError; end
end
