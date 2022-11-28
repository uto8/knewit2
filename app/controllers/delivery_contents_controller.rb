class DeliveryContentsController < ApplicationController
  before_action :search
  require 'csv'

  def search
    @q = DeliveryContent.ransack(params[:q])
  end

  def index
    @q = DeliveryContent.ransack(params[:q])
    @delivery_contents_results = @q.result(distinct: true).page(params[:page])
    @csv_data = @delivery_contents_results.joins(:delivery_destination).group('delivery_destinations.delivery_destination_name').pluck('delivery_destinations.delivery_destination_name')
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_posts_csv(@csv_data)
      end
    end
  end

  def import
    DeliveryContent.import(params[:file])
    redirect_to root_url, notice: "配送データをインポートしました。"
  end

  private

  def send_posts_csv(deliveries)
    csv_data = CSV.generate do |csv|
      column_names = %w(客先 運行車両 所属 最大積載量(kg) 納品回数 住所)
      csv << column_names
      deliveries.each do |delivery|
        delivery_data = @delivery_contents_results.joins(:delivery_destination).where(delivery_destinations: {delivery_destination_name: delivery})
        drivers = []
        delivery_data.each do |data|
          drivers.push(data.user.name)
        end
        offices = []
        delivery_data.each do |data|
          offices.push(data.user.driver_office)
        end
        weights = []
        delivery_data.each do |data|
          weights.push(data.truck.load_capacity)
        end
        column_values = [
          delivery,
          drivers,
          offices,
          weights,
          delivery_data.count,
          DeliveryDestination.find_by(delivery_destination_name:delivery).delivery_destination_address,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "配送データ.csv")
  end
end
