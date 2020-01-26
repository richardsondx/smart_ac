class Api::V1::DevicesController < ApplicationController
  def index
    @devices = Device.all
    render json: @devices.to_json
  end

  def show
    @device = Device.find(params[:id])
    render json: @device, include: :sensor_data
  end
end
