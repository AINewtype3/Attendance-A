class BasePointsController < ApplicationController
  def index
    @base_points = BasePoint.all
  end
end
