class VotesController < ApplicationController

  def create
    topic = Topic.find(vote_params[:topic])
    if topic.votes.create(vote_params.except(:topic))
      status = :ok
    else
      status = :bad_request
    end
    head status
  end

  private

  def vote_params
    params.require(:vote).permit(:valence, :topic)
  end
end
