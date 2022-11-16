class ActualVehicleRatesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result(distinct: true)

    array = []
    @delivery_contents_results.each do |data|
      array.push(data.delivery_roots.sum(:distance))
    end
    @total_distance = array.sum

    array2 = []
    @delivery_contents_results.each do |data|
      data.delivery_roots.each do |root|
        if root.is_loaded?
          array2.push(root.distance)
        end
      end
    end
    @actual_vehicle_distance = array2.sum
  end
end

# deliveryRootテーブルのis_loadedがtrueのdistanceの合計
