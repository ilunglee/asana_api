module AsanaAPI

  # Task
  class Task < AsanaAPI::Connect

    PATH = 'tasks'.freeze

    def index(workspace:, assignee:, completed_since: nil, modified_since: nil, options: {})
      get(
        path: PATH,
        params: {
          workspace: workspace, assignee: assignee,
          completed_since: completed_since, modified_since: modified_since
        }.merge(paginating_opts(options))
      )
    end

    def show(id:)
      get(path: "#{PATH}/#{id}")
    end

    def stories(id:)
      get(path: "#{PATH}/#{id}/stories")
    end

    def self.whitelist
      super + %i[stories]
    end

    private

    def fields
      %i[
        id assignee assignee_status created_at completed completed_at
        due_on due_at external followers hearted hearts modified_at name
        notes num_hearts projects parent workspace memberships
      ]
    end

  end

end
