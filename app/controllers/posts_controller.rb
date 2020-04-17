# frozen_string_literal: true

class PostsController < ApplicationController
  layout "posts"

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
    if @post.user_id != current_user.id
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You can only edit your own posts!' }
      end
    elsif time_limit?
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Error. You can only edit posts for 10 minutes!' }
      end
    end
  end

  def update
    find_post_by_id
      @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to posts_url, alert: 'Post successfully updated' }
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
    timediff = Time.zone.now - @post.created_at
    puts timediff
    if timediff > 600_000
      return false
    else
      return true
    end
  end

end
