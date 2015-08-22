class AssignmentsController < ApplicationController

  def create
    assignment = Assignment.new(assignment_params)
    if assignment.save
      status = :ok
    else
      status = :bad_request
    end
    head status
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :topic_id)
  end
end
