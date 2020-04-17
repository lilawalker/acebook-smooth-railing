require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user
  mock_post

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { comment: { comment_text: 'this is nice' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { comment: { comment_text: 'Hello, world!', post_id: 1 } }
      expect(Comment.find_by(comment_text: 'Hello, world!')).to be
    end
  end

end
