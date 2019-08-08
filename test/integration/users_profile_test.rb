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
    assert_match @user.events.count.to_s, response.body
    # assert_select 'div.pagination'
    @user.events.paginate(page: 1).each do |event|
      assert_match event.description, event.body
    end
  end
end
