# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      remember @user
      flash[:success] = 'Thank you for your sign up'
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.hosting_events.where("date > ?", DateTime.now).all.paginate(page: params[:page])
    @prev_events = @user.hosting_events.where("date < ?", DateTime.now).all.paginate(page: params[:page])
  end

  def hosting_events
    @user = current_user
    @event = Event.find(params[:id])
    @events = @user.hosting_events.paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
