class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:new, :create]
  layout "posts"
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_url, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    set_comment
    if @comment.user_id == current_user.id
      if time_limit?
        @comment.update(comment_params)
        respond_to do |format|
          format.html { redirect_to posts_url, alert: 'Comment successfully updated' }
        end
      else
        respond_to do |format|
          format.html { redirect_to posts_url, alert: 'Error. Time limit for editing comments exceeded!' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You can only edit your own comments!' }
      end
    end
  end

  def destroy
    set_comment
    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You can only delete your own comments!' }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    p params
    @comment = Comment.find(params[:id])

  end

  def comment_params
    params.require(:comment).permit(:comment_text, :post_id)
  end

  def time_limit?
    timediff = Time.zone.now - @comment.created_at
    if timediff > 600_000
      return false
    else
      return true
    end
  end

end
