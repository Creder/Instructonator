class StepsController < ApplicationController
  before_action :find_step
  before_action :find_comment, only: [:edit, :update, :destroy]
  load_and_authorize_resource




  
  
  def new
    @comment = Comment.new
  end

  def create
  	@comment = @step.comments.build(comments_params)
  	@comment.user = current_user
  	@comment.save

  	redirect_to :back
  end


  def edit
  end

  def destroy
  	@comment.destroy
    redirect_to :back
  end

  
  private

  def comments_params
    params.require(:comment).permit(:author, :content)
  end

  def find_comment
  	@comment = @step.comments.find(params[:id])
  end

  def find_step
  	@step = Step.find(params[:step_id])
  end

end