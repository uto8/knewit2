class DeliveryContentsController < ApplicationController
  def index
    @delivery_contents = DeliveryContent.all
  end
end
