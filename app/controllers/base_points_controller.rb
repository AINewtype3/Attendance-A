class BasePointsController < ApplicationController
  def index
    @base_points = BasePoint.all
  end
  
  def edit
    @base_point = BasePoint.find(params[:id])
  end
  
  def update
    if @base_point.update_attributes(base_point_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @base_point
    else
      render :edit      
    end
  end
end
