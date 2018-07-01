module AsanaAPI

  # Project
  class Project < AsanaAPI::Connect

    PATH = 'projects'.freeze

    def index(workspace: nil, team: nil, archived: nil)
      get(path: PATH, params: { workspace: workspace, team: team, archived: archived })
    end

    def show(id:)
      get(path: "#{PATH}/#{id}")
    end

    def sections(id:)
      get(path: "#{PATH}/#{id}/sections")
    end

    def self.whitelist
      super + %i[sections]
    end

    private

    def fields
      %i[
        name id owner current_status due_date created_at modified_at
        archived public members followers color notes workspace team
      ]
    end

  end

end
