class MileagesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result

    @delivery_contents = DeliveryContent.page(params[:page])

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
    dummies = Dummy.all

    dummy_drivers = []
    dummy_driver_mileages = []
    dummies.each do |dummy|
      if dummy.user.user_type == 'driver' && !dummy_drivers.include?(dummy.user.name)
        dummy_drivers.push(dummy.user.name)
        dummy_driver_mileages.push(dummies.joins(:user).where(users: {name: dummy.user.name}).sum(:distance))
      end
    end
    @dummy_drivers = dummy_drivers.to_json.html_safe
    @dummy_driver_mileages = dummy_driver_mileages.to_json.html_safe

    #全ドライバーの平均走行距離を出力
    if dummy_driver_mileages.length != 0
      @dummy_mileages_average = dummy_driver_mileages.sum / dummy_driver_mileages.length
    end
  end
end
