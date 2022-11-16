module ActualVehicleRatesHelper
  def actual_vehicle_rate(total_distance, actual_vehicle_distance)
    "#{actual_vehicle_distance / total_distance * 100}%"
  end
end
