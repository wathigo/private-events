# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include ApplicationHelper
  include AttendancesHelper
  include EventsHelper
  include SessionsHelper
  include UsersHelper

  helper_method :logged_in?
end
