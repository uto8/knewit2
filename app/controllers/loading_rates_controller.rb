class LoadingRatesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result

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

    tracks = []
    @delivery_contents_results.each do |data|
      tracks.push(data.truck.load_capacity)
    end

    if tracks.length != 0
      track_average = tracks.sum / tracks.length
    end

    if @delivery_contents_results[0].present?
      @loading_rate = average * 100 / (total_distance * track_average)
    end

  end
end
