module AsanaAPI

  RSpec.configure do |config|
    config.before(:each) do
      AsanaAPI.setup do |s|
        s.api_key = ENV['API_KEY']
      end
    end
  end

end
