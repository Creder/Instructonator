class StepsController < ApplicationController
  before_action :find_post
  before_action :find_step, only: [:edit, :update, :destroy]

  def index
    @steps = Step.order("priority")
  end

  def new
    @step = Step.new
  end

  def create
  	@step = @post.steps.build(steps_params)
  	@step.user = current_user
  	@step.save

  	redirect_to edit_post_path(@post)
  end


  def edit
  end

  def update
  	@step.update(steps_params)
    redirect_to edit_post_path(@post)
  end

  def destroy
  	@step.destroy
    redirect_to edit_post_path(@post)
  end

  def sort
    params[:step].each_with_index do |id, index|
      Step.where(id: id).update_all({priority: index+1})
    end
    render :nothing => true
end

  private

  def steps_params
    params.require(:step).permit(:title, :content, :stepimage)
  end

  def find_step
  	@step = @post.steps.find(params[:id])
  end

  def find_post
  	@post = Post.find(params[:post_id])
  end

end