class TopicsController < ApplicationController

  def create
    topic = Topic.create(topic_params.except(:event))
    if topic.save
      status = :ok
    else
      status = :bad_request
    end
    render json: {}, status: :ok
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
