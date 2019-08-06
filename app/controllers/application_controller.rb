# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include SessionsHelper

  helper_method :signed_in?
end
