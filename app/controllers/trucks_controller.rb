class TrucksController < ApplicationController
  before_action :search

  def search
    @q = Truck.ransack(params[:q])
  end

  def index
    @truck_results = @q.result(distinct: true).page(params[:page])
    @trucks = Truck.all
  end

  def import
    Truck.import(params[:file])
    redirect_to trucks_path, notice: "トラックをインポートしました。"
  end
end
