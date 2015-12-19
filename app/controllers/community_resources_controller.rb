class CommunityResourcesController < ApplicationController
  before_filter :set_resource, :except => [:index, :create]
  def set_resource
    @resource = CommunityResource.find(params['id'])
  end

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
    render json: @resources
  end

  def destroy
    @resource.delete
    head :ok
  end

  def update
    @resource.update_attributes(community_resource_params)
    render json: @resource
  end

  private

  def community_resource_params
    params.require(:community_resource).permit(:title, :url, :description, :group, :is_approved)
  end
end
