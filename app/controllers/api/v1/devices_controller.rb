class Api::V1::DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:record]

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  resource_description do 
     name 'Devices'
  end
  
  api :GET, '/v1/devices', 'Show All Devices'
  description 'Display a list of all existing devices'
  error 500, "Something went wrong"
  example <<-EOS
    [
      {
      id: 1,
      serial_number: "123456789",
      registration_date: "2019",
      firmware_version: "1",
      created_at: "2020-01-25T18:54:12.055Z",
      updated_at: "2020-01-25T18:54:12.055Z"
      },
      {
      id: 2,
      serial_number: "123456790",
      registration_date: "2019",
      firmware_version: "2",
      created_at: "2020-01-25T18:54:12.061Z",
      updated_at: "2020-01-25T18:54:12.061Z"
      }
    ]
  EOS

  def index
    @devices = Device.all
    render json: @devices.to_json
  end

  api :GET, '/v1/devices/:id', "Show Device's Details"
  desc 'Get information of a device given a specific id'
  param :id, String, desc: 'id of the requested user'
  error 404, "No device with that id was found"
  error 500, "Something went wrong"
  example <<-EOS
    {
      id: 1,
      serial_number: "123456789",
      registration_date: "2019",
      firmware_version: "1",
      created_at: "2020-01-25T18:54:12.055Z",
      updated_at: "2020-01-25T18:54:12.055Z"
    }
  EOS
  def show
    @device = Device.find(params[:id])
    render json: @device, include: :sensor_data
  end

  api :POST, '/v1/devices/:id/record', 'Create a Sensor Record'
  desc 'Send a request to save sensor data from a given device id'
  param :id, String, desc: 'The serial number of the AC unit'
  param :sensor, Hash, desc: 'device object' do 
    param :category, String, desc: 'the cateogry type of the sensor'
    param :value, String, desc: 'the value of the sensor'
  end
  error 404, "No device with that id was found"
  error 500, "Something went wrong"
  error :unprocessable_entity, "Could not save the entity."
  example <<-EOS
    sensor: {
      category: 'air_humidity',
      value: "1",
    }
  EOS
  def record
    @device = Device.find(params[:id])
    @device.sensor_data.record_data(category: sensor_params[:category], value: sensor_params[:value])
    render json: @device.to_json, include: :sensor_data
  end

  private

  def sensor_params
    params.require(:sensor).permit(:category, :value)
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
