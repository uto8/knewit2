class LoadingRatesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result(distinct: true)

    distances = []
    @delivery_contents_results.each do |data|
      distances.push(data.distance)
    end
    total_distance = distances.sum

    # 分子の計算
    array = []
    @delivery_contents_results.each do |data|
      array.push(data.distance * data.loading_weight)
    end
    average = array.sum

    if @delivery_contents_results[0].present?
      @loading_rate = average * 100 / (total_distance * @delivery_contents_results[0].truck.load_capacity)
    end

  end
end
