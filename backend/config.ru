$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'sinatra'
require 'backend'

run Backend
