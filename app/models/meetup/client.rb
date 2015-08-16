module Meetup
  class Client

    def self.get_members
      new.get_members
    end

    def get_members
      response = connection.get(members_path, members_params)
      response.body
    end

    private

    def connection
      conn = Faraday.new(url: "http://#{domain}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def domain
      'api.meetup.com'
    end

    def members_path
      '/2/members'
    end

    def members_params
      required_parameters.merge({ group_id: ENV['MEETUP_GROUP_ID'] })
    end

    def required_parameters
      {
        key: ENV['MEETUP_API_KEY'],
        sign: true
      }
    end

  end
end
