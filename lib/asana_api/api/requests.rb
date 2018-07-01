module AsanaAPI

  module API

    # Requests Module
    module Requests

      def self.included(base)
        base.extend ClassMethods
      end

      # ClassMethods
      module ClassMethods

        def respond_to_missing?(method_name, include_private = false)
          callable?(method_name) || actionable?(method_name) || super
        end

        def method_missing(method_name, *args, &block)
          if callable?(method_name)
            new.send(method_name, *args, &block)
          elsif actionable?(method_name)
            response = new.send(method_name[0..-2], *args, &block)
            handle_response(response)
          else
            super
          end
        end

        def actionable?(method_name)
          method_name =~ /(.+)!$/ && respond_to?(Regexp.last_match(1))
        end

        def callable?(method_name)
          whitelist.include? method_name
        end

        def handle_response(response)
          raise AsanaAPI::Exceptions::RequestFailedError, response unless response.code == 200
          JSON.parse(response.body)['data']
        rescue JSON::ParserError => e
          raise AsanaAPI::Exceptions::RequestFailedError.new(msg: e.message)
        end

        def whitelist
          %i[index show]
        end

      end

      module_function

      def missing_keys?
        AsanaAPI.api_key.nil?
      end

      def encode_params(params:)
        params ||= {}
        params   = default_params.merge(params)
        URI.encode_www_form(params)
      end

      def default_params
        { access_token: AsanaAPI.api_key }
      end

    end

  end

end
