module AsanaAPI

  # Tag
  class Tag < AsanaAPI::Connect

    PATH = 'tags'.freeze

    def index(workspace: nil, team: nil, archived: nil, options: {})
      params =
        if workspace.nil?
          {}
        else
          { workspace: workspace, team: team, archived: archived }.
            merge(paginating_opts(options))
        end
      get(path: PATH, params: params)
    end

    def show(id:)
      get(path: "#{PATH}/#{id}")
    end

    private

    def fields
      %i[id created_at followers name color notes workspace]
    end

  end

end
