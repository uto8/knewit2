class LoadsController < ApplicationController
  before_action :search

  def search
    @q = Load.ransack(params[:q])
  end

  def index
    @load_results = @q.result(distinct: true)
    @loads = Load.all
  end
end
