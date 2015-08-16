module Parsers
  class User
    include LazyDoc::DSL

    access :name                                        # Access the attribute "name"
    access :address, via: :streetAddress                # Access the attribute "streetAddress"
    access :job, via: [:profile, :occupation, :title]   # Access the attribute "title" found at "profile" -> "occupation"

    def initialize(json)
      lazily_embed(json)                                # Initialize the LazyDoc object
    end
  end
end
