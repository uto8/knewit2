class LoadingRatesController < ApplicationController
  before_action :search

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result(distinct: true)
  end
end
