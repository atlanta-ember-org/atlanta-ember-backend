class TopicsController < ApplicationController

  def create
    topic = Topic.create(topic_params.except(:event))
    if topic.save
      render json: {}
    else
      render json: JsonapiErrorsResponse.new(topic).to_json, status: 422
    end
  end

  def index
    @topics = Topic.all
    render json: @topics, each_serializer: TopicSerializer
  end

  def show
    @topic = Topic.find(params[:id])
    render json: @topic
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :event)
  end
end
