# frozen_string_literal: true

require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'profile display' do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'h1', text: @user.name + ', ' + @user.email
  end
end
