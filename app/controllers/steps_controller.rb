class StepsController < ApplicationController
  before_action :find_post 
  before_action :find_step, only: [:update, :destroy]
  def create
  	@step = @post.steps.build(steps_params)
  	@step.user_id = current_user
  	@step.save

  	redirect_to @post_edit_path
  end

  def new
    @step = Step.new
  end

  def update
  	@step.update(steps_params)
  end

  def destroy
  	@step.destroy
  end

  private

  def steps_params
    params.require(:step).permit(:title, :content)
  end

  def find_step
  	@step = @post.steps.find(params[:id])
  end

  def find_post
  	@post = Post.find(params[:post_id])
  end

end