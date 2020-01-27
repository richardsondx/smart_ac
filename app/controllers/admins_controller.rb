class AdminsController < ApplicationController
  def index
    @devices = Device.all
  end
end
