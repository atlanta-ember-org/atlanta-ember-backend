module Meetup
  class Client

    def initialize
      @page_num = 0
      @collection = []
    end

    def collect_all(path, params)
      response = connection.get(path, required_parameters.merge(params))
      new_items = JSON.parse(response.body)['results']
      @collection += new_items
      if new_items.length == 200
        @page_num += 1
        collect_all(path, params)
      else
        return @collection
      end
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

    def required_parameters
      params = {
        key: MEETUP_API_KEY,
        sign: true,
      }
      params[:offset] = @page_num if @page_num
      params
    end
  end
end
