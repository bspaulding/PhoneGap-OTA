class PhoneGapUsersController < ApplicationController
  def new
  end

  def create
    @user = PhoneGapUser.find_or_create_by_email(params[:phone_gap_user])
    @user.load_apps(params[:password])

    redirect_to phone_gap_user_apps_path(@user)
  end
end
