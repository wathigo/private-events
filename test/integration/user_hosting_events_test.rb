# frozen_string_literal: true

require 'test_helper'

class UserHostingEventsTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
  end

  test 'profile display' do
    log_in_as(@michael)
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert_template 'users/show'
    assert_select 'h1', text: @michael.name + ', ' + @michael.email
    assert_match @michael.hosting_events.count.to_s, response.body
    assert_select 'div.pagination'
    first_page = @michael.hosting_events.paginate(page: 1)
    first_page.each do |event|
      assert_select '.creator a', text: @michael.name
    end
  end
end
