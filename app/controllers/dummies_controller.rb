class DummiesController < ApplicationController
  def index
    @dummies = Dummy.page(params[:page])
  end

  def new
  end

  def import
    Dummy.import(params[:file])
    redirect_to dummies_path, notice: "配送データをインポートしました。"
  end
end
