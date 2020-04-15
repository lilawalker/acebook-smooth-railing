# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.order(:created_at).reverse_order
  end

  def destroy
    find_post_by_id
    if @post.user_id == current_user.id
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You can only delete your own posts!' }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    find_post_by_id
    if @post.user_id == current_user.id
      if time_limit?
        @post.update(post_params)
        respond_to do |format|
          format.html { redirect_to posts_url, alert: 'Post successfully updated' }
        end
      else
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You have ran out of time!' }
      end
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You can only delete your own posts!' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :name)
  end

  def find_post_by_id
    @post = Post.find(params[:id])
  end

  def time_limit?
    timediff = Time.now - @post.created_at
    if timediff > 600000
      return false
    else
      return true
    end
  end

end
