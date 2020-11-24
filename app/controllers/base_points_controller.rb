class BasePointsController < ApplicationController
  def index
    @base_points = BasePoint.all
  end
  
  def edit
    @base_point = BasePoint.find(params[:id])
  end
  
  def update
  end
end
