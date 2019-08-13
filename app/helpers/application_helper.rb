# frozen_string_literal: true

module ApplicationHelper
  def per_page
    6
  end

  # Confirms a logged-in user
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'Please log in'
    redirect_to login_url
  end
end
