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
    p @post
    if @post.user_id == current_user.id
      @post.destroy
      # redirect_to(:posts)
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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

end
