# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information followed by logout' do
    get login_path
    post login_path, params: { session: { email: @user.email } }
    assert logged_in?
    follow_redirect!
    delete logout_path
    assert_not logged_in?
  end

  test 'login with remembering' do
    log_in_as(@user)
    assert_not_empty cookies[:remember_token]
  end
end
