class BasePointsController < ApplicationController
  def index
    @base_points = Base.all
  end
end
