class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Topic was created successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error creating the topic. Please try again."
      render :new
    end
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was deleted."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :user)
  end

end
