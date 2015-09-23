class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    @topics = Topic.all
    respond_to do |format|
    	format.html { @topics}
    	format.json { render json: @topics}
    end
  end

  def show
    respond_to do |format|
    	format.html { @topic}
    	format.json { render json: @topic}
    end
  end

  def new
    @topic = Topic.new
    respond_to do |format|
    	format.html { @topic}
    	format.json { render json: @topic}
    end
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    respond_to do |format|
    	format.html {redirect_to  @topic}
    	format.json { render json: @topic}
    end
  end

  def update
    @topic.update(topic_params)
    respond_to do |format|
    	format.html {redirect_to @topic}
    	format.json { render json: @topic}
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
    	format.html {redirect_to @topic}
    	format.json { render json: @topic}
    end
  end

  def get_topic_list 
	# Get all topics which are not already taken by any other group
	@topics = Topic.where(group_id: nil).all
	render partial: '/topics/topic_list' , layout: false 
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :subject)
    end
end
