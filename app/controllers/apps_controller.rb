class AppsController < ApplicationController
  def index
    @user = PhoneGapUser.find(params[:phone_gap_user_id])
    @apps = @user.apps
  end

  def show
    @app = App.find(params[:id])

    render :layout => false
  end
end
