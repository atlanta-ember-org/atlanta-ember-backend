module Meetup
  class Member

    def self.all
      new.all
    end

    def initialize(client: Meetup::Client)
      @client = client.new
    end

    def all
      @client.collect_all(members_path, members_params)
    end

    private

    def members_path
      '/2/members'
    end

    def members_params
      { group_id: ENV['MEETUP_GROUP_ID'] }
    end
  end
end
