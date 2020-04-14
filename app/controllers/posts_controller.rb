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

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :name)
  end

end
