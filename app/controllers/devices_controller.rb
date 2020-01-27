class DevicesController < ApplicationController
  def show
    @device = Device.find(params[:id])
    @sensor_data = @device.sensor_data
  end
end
