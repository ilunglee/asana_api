require 'bundler/setup'
Bundler.setup

require 'ap'
require 'webmock/rspec'
require 'byebug'
require 'asana_api'
require 'vcr'
require 'dotenv/load'

WebMock.disable_net_connect!(allow_localhost: true)

Dir['./spec/support/**/*.rb'].each { |f| require f }
