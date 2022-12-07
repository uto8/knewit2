class ActualVehicleRatesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result


    array = []
    @delivery_contents_results.each do |data|
      array.push(data.distance)
    end
    @total_distance = array.sum

    array2 = []
    @delivery_contents_results.each do |data|
      if data.loading_weight != 0
        array2.push(data.distance)
      end
    end
    @actual_vehicle_distance = array2.sum

    dammies = Dummy.all
    dummy_array = []
    dammies.each do |dummy|
      dummy_array.push(dummy.distance)
    end
    @dummy_total_distance = dummy_array.sum

    dummy_array2 = []
    dammies.each do |dummy|
      if dummy.loading_weight != 0
        dummy_array2.push(dummy.distance)
      end
    end
    @dummy_actual_vehicle_distance = dummy_array2.sum
  end
end

# deliveryRootテーブルのis_loadedがtrueのdistanceの合計
