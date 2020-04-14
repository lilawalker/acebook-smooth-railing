module PostHelper
  def add_post(_text)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: _text
    click_button 'Submit'
  end
end
