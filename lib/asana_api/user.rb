module AsanaAPI

  # User
  class User < AsanaAPI::Connect

    PATH = 'users'.freeze

    def index(workspace: nil, options: {})
      params = workspace.nil? ? {} : { workspace: workspace }.merge(paginating_opts(options))
      get(path: PATH, params: params)
    end

    def show(id:)
      get(path: "#{PATH}/#{id}")
    end

    private

    def fields
      %i[id name email photo workspace]
    end

  end

end
