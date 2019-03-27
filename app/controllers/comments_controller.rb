class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [ :reply, :edit, :update, :destroy ]
 
 
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
        format.js
      else
        format.json { render json: @comment.errors }
        format.js
      end
    end
  end
 
  def edit
  end
 
  private
 
  def set_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
 
  def set_comment
    begin
      @comment = @commentable.comments.find(params[:id])
    rescue => e
      logger.error "#{e.class.name} : #{e.message}"
      @comment = @commentable.comments.build
      @comment.errors.add(:base, :recordnotfound, message: "That record doesn't exist. Maybe, it is already destroyed.")
    end
  end
 
  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end