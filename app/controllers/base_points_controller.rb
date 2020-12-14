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
      flash[:success] = "拠点情報を更新しました。"
      redirect_to base_points_url
    else
      render :edit      
    end
  end
  
  def destroy
    @base_point = BasePoint.find(params[:id])
    @base_point.destroy
    flash[:success] = "拠点番号#{@base_point.base_point_number}のデータを削除しました。"
    redirect_to base_points_url
  end
  
  
  private

    def base_point_params
      params.require(:base_point).permit(:base_point_number, :base_point_name, :attendance_type)
    end
  
end
