require 'rails_helper'
require_relative '../support/post_helper.rb'

RSpec.feature 'Delete Post', type: :feature do
  xscenario 'user can delete their own post' do
    user = FactoryBot.create(:user)
    log_in(user)
    add_post('This is a new post')
    expect(current_path).to eq '/posts'
    expect(page).to have_link 'Delete Post'
    click_link 'Delete Post'
    expect(page).not_to have_content 'Post has been successfully deleted'
  end
end
