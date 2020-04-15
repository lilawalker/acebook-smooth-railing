require 'rails_helper'
require_relative '../support/post_helpers.rb'

RSpec.feature 'Comment', type: :feature do

  xscenario 'user can comment on any post' do
    user = FactoryBot.create(:user)
    log_in(user)
    post = FactoryBot.create(:post)
    click_link 'Add comment'
    fill_in 'comment_text', with: 'I love your post'
    click_link 'Submit'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'I love your post'
  end
end
