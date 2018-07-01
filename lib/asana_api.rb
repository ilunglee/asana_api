# Require Dependencies
require 'rest-client'
require 'digest'
require 'logger'
require 'json/ext'

# Require Extensions
require 'extensions/array'

# Require Exceptions
require 'asana_api/exceptions/errors'

# Require API
require 'asana_api/api/requests'

# Require CRUD
require 'asana_api/connect'
require 'asana_api/project'
require 'asana_api/user'
require 'asana_api/tag'
require 'asana_api/task'
require 'asana_api/workspace'
require 'asana_api/team'

# Base
module AsanaAPI

  @api_base  = 'https://app.asana.com/api/1.0'
  @log_level = nil
  @logger    = nil

  class << self

    attr_accessor :api_key

    # Extend array class
    class ::Array; include AsanaAPI::Array; end

  end

  def self.api_base
    @api_base
  end

  def self.setup
    yield self
  end

end
