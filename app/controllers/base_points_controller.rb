class BasePointsController < ApplicationController
  def index
    @base_points = BasePoint.all
  end
  
  def edit
    @base_point = BasePoint.find(params[:id])
  end
  
  def update
    @base_point = BasePoint.find(params[:id])
    if @base_point.update_attributes(base_point_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to base_points_url
    else
      render :edit      
    end
  end
  
  
  private

    def base_point_params
      params.require(:base_point).permit(:base_point_number, :base_point_name, :attendance_type)
    end
  
end
