class MileagesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result(distinct: true)

    # driver_results = @delivery_contents_results.group

    # 横軸に使うドライバーを取得
    drivers = []
    driver_mileages = []
    @delivery_contents_results.each do |data|
      if data.user.user_type == "driver" && !drivers.include?(data.user.name)
        drivers.push(data.user.name)
        driver_mileages.push(@delivery_contents_results.joins(:user).where(users: {name: data.user.name}).sum(:distance))

      end
    end
    @drivers = drivers.to_json.html_safe
    @driver_mileages = driver_mileages.to_json.html_safe

    # 縦軸に使う走行距離を取得
    # driver_mileage = []
    # drivers.each do |driver|
    #   driver_mileage.push()
    #   @delivery_contents_results.
    # end
  end
end
