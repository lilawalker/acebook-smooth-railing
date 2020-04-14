module LogInHelper

  def log_in(user)
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

end
