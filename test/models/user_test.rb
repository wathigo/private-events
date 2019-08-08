# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test "associated events should be destroyed" do
    @user.save
    @user.events.create!(title: "Lorem ipsum",
                             description: "Alias quos facilis laudantium in aut maiores magnam minus",
                             date: "08/08/2020", location: "Jades Complex")
    assert_difference 'Event.count', -1 do
      @user.destroy
    end
  end
end
