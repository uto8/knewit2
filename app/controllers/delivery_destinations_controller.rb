class DeliveryDestinationsController < ApplicationController
  def index
    @delivery_destination = DeliveryDestination.all.page(params[:page])
  end

  def new
  end

  def import
    DeliveryDestination.import(params[:file])
    redirect_to trucks_path, notice: "納入先情報をインポートしました。"
  end
end
