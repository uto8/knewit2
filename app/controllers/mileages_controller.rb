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
    @delivery_contents_results.each do |data|
      drivers.push(data.user.name)
    end
    @drivers = drivers.to_json.html_safe

    # 縦軸に使う走行距離を取得
    # drivers.each do |driver|

    # end
  end
end
