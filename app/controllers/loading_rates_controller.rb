class LoadingRatesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result

    @delivery_contents = DeliveryContent.page(params[:page])

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

    # ダミーデータ
    dammies = Dummy.all
    dammy_distances = []
    dammies.each do |dummy|
      dammy_distances.push(dummy.distance)
    end
    dammy_total_distance = dammy_distances.sum

    dammy_array = []
    dammies.each do |dummy|
      dammy_array.push(dummy.distance * dummy.loading_weight)
    end
    dammy_average = array.sum

    dammy_trucks = []
    dammies.each do |dummy|
      dammy_trucks.push(dummy.truck.load_capacity)
    end

    if dammy_trucks.length != 0
      dammy_truck_average = dammy_trucks.sum / dammy_trucks.length
    end

    if dammies[0].present?
      @dammy_loading_rate = dammy_average * 100 / (dammy_total_distance * dammy_truck_average)
    end
  end
end
