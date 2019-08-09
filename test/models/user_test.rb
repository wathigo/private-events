# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @michael = users(:michael)
    @events_count = @michael.hosting_events.count
  end

  test 'should be valid' do
    assert @michael.valid?
  end

  test 'name should be present' do
    @michael.name = '     '
    assert_not @michael.valid?
  end

  test 'email should be present' do
    @michael.email = '     '
    assert_not @michael.valid?
  end

  test 'associated events should be destroyed' do
    assert_difference 'Event.count', -@events_count do
      @michael.destroy
    end
  end
end
