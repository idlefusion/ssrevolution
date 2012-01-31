require 'rubygems'
require 'bundler/setup'

# Google Analytics: UNCOMMENT IF DESIRED, THEN ADD YOUR OWN ACCOUNT INFO HERE!
#require 'rack/google-analytics'
#use Rack::GoogleAnalytics, :tracker => "UA-28790814-1'"


require './app'
run Sinatra::Application