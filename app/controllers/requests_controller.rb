class RequestsController < ApplicationController

  before_action :set_request, except: [:index, :create]

  def index
    @request  = Request.new
    @requests = Request.order('created_at DESC')
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_url, notice: "Request was successfully created."
    else
      flash[:error] = @request.errors.full_messages.join(", ")
      render :index
    end
  end

  def show    
  end
  
  def add_comment
    @video_yt = Video.insert_comment(@video.uid, params[:comment])
    if @video_yt
      respond_to do |format|
        format.js { render :layout => false }
      end
    end
  end
  def like
    @video.liked_by current_user
    respond_to do |format|
      format.js { render :vote,  locals: { vote: 'like' }, layout: false }
    end
  end

  def dislike
    @video.downvote_from current_user
    respond_to do |format|
      format.js { render :vote,  locals: { vote: 'dislike' }, layout: false }
    end
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:title, :description )
    end

end