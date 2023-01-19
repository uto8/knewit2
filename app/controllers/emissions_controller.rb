class EmissionsController < ApplicationController
  def index
    @emissions = Co2Emission.all
    @q = Co2Emission.ransack(params[:q])
    @co2_emissions_results = @q.result
    # 月ごとの合計の配列
    months = []
    co2 = []
    @co2_emissions_results.each do |result|
      if !months.include?(result.date.strftime("%Y/%m"))
        months.push(result.date.strftime("%Y/%m"))
        # co2.push(@co2_emissions_results.where("to_char(date,'MM') = #{result.date.strftime("%Y/%m")}").sum(:emission))
      end
    end
    @months = months.to_json.html_safe
    @co2 = co2.to_json.html_safe
    # @co2 =co2
  end
end
