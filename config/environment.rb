# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'
# require google api
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'

require 'byebug'


require 'json'
require 'base64'
require 'net/https'
require 'dotenv'
require 'pg'
require 'bcrypt'
require 'active_record'
require 'logger'
<<<<<<< HEAD
require 'thin'
require 'sinatra'
require 'oauth2'
require 'erb'
=======

require 'sinatra'

require 'erb'

>>>>>>> cb7a4d6a4c019f4cb0b88ffac7209ca6a71c358a
# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

<<<<<<< HEAD
Dotenv.load

CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']

#     CLIENT ||= OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, {
#                   :site => 'https://accounts.google.com',
#                   :authorize_url => "/o/oauth2/auth",
#                   :token_url => "/o/oauth2/token"
#                 })

# Google::APIClient.new(
#       :authorization => :oauth_2,
#       :host => 'www.googleapis.com',
#       :http_adapter => HTTPAdapter::NetHTTPAdapter.new
#     )

PLUS_LOGIN_SCOPE = 'https://www.googleapis.com/auth/plus.me'
# $credentials = Google::APIClient::ClientSecrets.load
$authorization = Signet::OAuth2::Client.new(
    :authorization_uri => 'http://localhost:9393/auth',
    :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
    :client_id => ENV['CLIENT_ID'],
    :client_secret => ENV['CLIENT_SECRET'],
    :redirect_uri => 'http://localhost:9393/callback',
    :scope => PLUS_LOGIN_SCOPE)
$client = Google::APIClient.new
=======

>>>>>>> cb7a4d6a4c019f4cb0b88ffac7209ca6a71c358a

