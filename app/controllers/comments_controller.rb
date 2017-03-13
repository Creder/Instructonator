class CommentsController < ApplicationController
  before_action :find_step, only: :create
  before_action :find_comment, only: :destroy
  load_and_authorize_resource

  def create
    @comment = @step.comments.build(commets_params)
    @comment.user = current_user
    @comment.save

    redirect_to :back
  end

  def destroy
  	@comment.destroy

  	redirect_to :back
  end
  
  private

  def commets_params
     params.require(:comment).permit(:content)
  end

  def find_step
    @step = Step.find(params[:step_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end