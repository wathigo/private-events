require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @event = Event.new(title: "Lorem ipsum", date: "05/05/2020", location: "Medi's House", user_id: @user.id)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "user should be present" do
    @event.user_id = nil
    assert_not @event.valid?
  end

  test "title should be present" do
    @event.title = "   "
    assert_not @event.valid?
  end

  test "date should be present" do
    @event.date = " "
    assert_not @event.valid?
  end

  test "location should be present" do
    @event.location = " "
    assert_not @event.valid?
  end
end
