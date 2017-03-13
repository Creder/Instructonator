class StepsController < ApplicationController
  before_action :find_post, only: [:new, :create]
  before_action :find_step, only: [:edit, :update, :destroy]

  def index
    @steps = Step.order("priority").page(params[:page]).per(1)
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
    redirect_to :back
  end

  def destroy
  	@step.destroy
    redirect_to :back
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
  	@step = Step.find(params[:id])
  end

  def find_post
  	@post = Post.find(params[:post_id])
  end

end