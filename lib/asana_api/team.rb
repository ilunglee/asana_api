module AsanaAPI

  # Team
  class Team < AsanaAPI::Connect

    PATH = 'teams'.freeze

    def index(organization:, options: {})
      get(path: "organizations/#{organization}/teams", params: paginating_opts(options))
    end

    def show(id:)
      get(path: "#{PATH}/#{id}")
    end

    def users(id:)
      get(path: "#{PATH}/#{id}/users")
    end

    def self.whitelist
      super + %i[users]
    end

    private

    def fields
      %i[id name]
    end

  end

end
