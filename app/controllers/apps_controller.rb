class AppsController < ApplicationController
  def index
    @user = PhoneGapUser.new(params[:username], params[:password])
    @apps = @user.apps
  end

  def show
    @user = PhoneGapUser.new(params[:username], params[:password])
    @app = @user.apps.select {|app| app["id"].to_s == params[:id].to_s }.first
    @app["version"] = "1.0" if @app["version"].blank?
    @app["url"] = ["https://build.phonegap.com", @app["download"]["ios"]].join

    render :layout => false
  end
end
