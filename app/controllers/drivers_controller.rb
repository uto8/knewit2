class DriversController < ApplicationController
  def index
    @drivers = User.where(user_type:1).page(params[:page])
  end

  def import
    User.import(params[:file])
    redirect_to drivers_path, notice: "ドライバーをインポートしました。"
  end
end
