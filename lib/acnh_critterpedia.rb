require 'httparty'
require 'require_all'
require 'terminal-table'
require 'colorize'

require 'acnh_critterpedia/version'
require_all 'lib/acnh_critterpedia'

module AcnhCritterpedia
  class Error < StandardError; end
end
