class CommentsController < ApplicationController
  before_action :find_step, only: :create
  before_action :find_comment, only: :destroy

  def create
    @comment = @step.comments.build(commets_params)
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
 
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