class TopicsController < ApplicationController

  def create
    topic = Topic.new(topic_params)

    if topic.save
      status = :ok
    else
      status = :bad_request
    end
    head status
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
    params.require(:topic).permit(:name, :description, :event_id)
  end
end
