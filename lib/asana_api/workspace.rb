module AsanaAPI

  # Workspace
  class Workspace < AsanaAPI::Connect

    PATH = 'workspaces'.freeze

    def index(options: {})
      get(path: PATH, params: paginating_opts(options))
    end

    def show(id:)
      get(path: "#{PATH}/#{id}")
    end

    private

    def fields
      %i[id name is_organization]
    end

  end

end
