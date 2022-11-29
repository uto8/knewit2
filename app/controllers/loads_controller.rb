class LoadsController < ApplicationController
  before_action :search

  def search
    @q = Load.ransack(params[:q])
  end

  def import
    Load.import(params[:file])
    redirect_to root_url, notice: "荷物情報をインポートしました。"
  end

  def index
    @load_results = @q.result(distinct: true).page(params[:page])
    @loads = Load.all
  end
end
