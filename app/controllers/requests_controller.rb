class RequestsController < ApplicationController

  before_action :set_request, except: [:index, :create, :search]

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
  
  def search
    @requests = Request.search(params[:search], params[:order_by])    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def like
    @request.liked_by current_user
    respond_to do |format|
      format.js { render :vote,  locals: { vote: 'like' }, layout: false }
    end
  end

  def dislike
    @request.downvote_from current_user
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