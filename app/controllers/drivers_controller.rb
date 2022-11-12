class DriversController < ApplicationController
  def index
    @drivers = User.where(user_type:1)
  end
end
