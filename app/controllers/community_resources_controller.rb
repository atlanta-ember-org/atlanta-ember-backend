class CommunityResourcesController < ApplicationController
	def create
      resource = CommunityResource.new(community_resource_params)
      if resource.save
        status = :ok
      else
        status = :bad_request
      end
      head status
    end

    def index
      @resources = CommunityResource.all
      render json: @resources, each_serializer: CommunityResourceSerializer
    end

    private

    def community_resource_params
      params.require(:community_resource).permit(:title, :url, :description, :group)
    end
end
