require 'rails_helper'
require_relative '../support/post_helper.rb'

RSpec.feature 'Comment', type: :feature do

  scenario 'user can comment on any post' do
    user = FactoryBot.create(:user, :fake)
    log_in(user)
    add_post("This is an example post")
    fill_in 'comment_comment_text', with: 'I love your post'
    click_button 'Create Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'I love your post'
  end
end
