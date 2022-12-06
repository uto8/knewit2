class MileagesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result

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

    #全ドライバーの平均走行距離を出力
    if driver_mileages.length != 0
      @mileages_average = driver_mileages.sum / driver_mileages.length
    end

    #ダミーデータ
    @qDummy = Dummy.ransack(params[:q])
    @dummy_results = @qDummy.result

    # driver_results = @delivery_contents_results.group

    # 横軸に使うドライバーを取得
    driversDummy = []
    driver_mileagesDummy = []
    @dummy_results.each do |data|
      if data.user.user_type == "driver" && !drivers.include?(data.user.name)
        driversDummy.push(data.user.name)
        driver_mileagesDummy.push(@dummy_results.joins(:user).where(users: {name: data.user.name}).sum(:distance))
      end
    end
    @drivers = driversDummy.to_json.html_safe
    @driver_mileages = driver_mileagesDummy.to_json.html_safe

    #全ドライバーの平均走行距離を出力
    if driver_mileagesDummy.length != 0
      @mileages_average = driver_mileagesDummy.sum / driver_mileagesDummy.length
    end
  end
end
