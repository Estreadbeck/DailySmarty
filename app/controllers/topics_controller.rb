class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      redirect_to topic_path(@topic), notice: 'Topic was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic), notice: 'Your topic was successfully updated.'
    else
      render :edit, notice: 'There was an error processing your request'
    end
  end

  private

    def topic_params
      params.require(:topic).permit(:title,
                                    posts_attributes: [:id, :title, :content, :topic_id]
                                    )
    end

    def set_topic
      @topic = Topic.friendly.find(params[:id])
    end
end
