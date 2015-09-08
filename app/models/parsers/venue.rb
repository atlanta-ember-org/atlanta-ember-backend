module Parsers
  class Venue
    include LazyDoc::DSL

    access :country
    access :city
    access :address_1
    access :name
    access :lon
    access :lat
    access :repinned

    def initialize(json)
      lazily_embed(json)
    end

    def uid
      "#{country}_#{city}_#{address_1}_#{name}"
    end

    def to_hash
      {
        country:        country,
        city:           city,
        address_1:      address_1,
        name:           name,
        lon:            lon,
        lat:            lat,
        repinned:       repinned,
        uid:            uid
      }
    end
  end
end
