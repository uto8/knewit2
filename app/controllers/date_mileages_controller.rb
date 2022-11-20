class DateMileagesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result(distinct: true)

    # driver_results = @delivery_contents_results.group

    # 横軸に使う日付を取得
    dates = []
    driver_mileages = []
    @delivery_contents_results.each do |data|
      if data.user.user_type == "driver" && !dates.include?(data.delivery_date)
        dates.push(data.delivery_date)
        driver_mileages.push(@delivery_contents_results.where(delivery_date: data.delivery_date).sum(:distance))
      end
    end
    @dates = dates.to_json.html_safe
    @driver_mileages = driver_mileages.to_json.html_safe
  end
end
