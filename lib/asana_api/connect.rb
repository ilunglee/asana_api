module AsanaAPI

  # Connect
  class Connect

    include AsanaAPI::API::Requests

    attr_accessor :opt_fields, :opt_expand, :response

    def initialize(options: {})
      missing_keys? &&
        raise(AsanaAPI::Exceptions::KeyMissingError.
              new(msg: 'missing api_key'))
      @opt_fields = options.delete(:opt_fields) { fields }
      @opt_expand = options.delete(:opt_expand) { fields }
    end

    def parsed
      self.class.handle_response(response)
    end

    private

    def get(path:, params: {})
      params.delete_if { |_k, v| v.nil? }
      self.response =
        RestClient.get("#{AsanaAPI.api_base}/#{path}?#{get_params(params)}")
    rescue RestClient::BadRequest => e
      raise AsanaAPI::Exceptions::RequestFailedError.new(msg: e.message)
    end

    def get_params(params)
      encode_params(params: params.merge(opt_fields: opt_fields, opt_expand: opt_expand))
    end

    def fields
      %i[]
    end

    def paginating_opts(options)
      options.slice(%i[limit offset])
    end

  end

end
