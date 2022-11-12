class TrucksController < ApplicationController
  before_action :search

  def search
    @q = Truck.ransack(params[:q])
  end

  def index
    @truck_results = @q.result(distinct: true)
    @trucks = Truck.all
  end
end
