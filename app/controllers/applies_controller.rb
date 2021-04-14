class AppliesController < ApplicationController
  
  def index
    @applies = Apply.where(superior_id: @user_id)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    @user = User.find(params[:user_id])
    @apply = Apply.new(apply_params)
    if @apply.save
      flash[:success] = '勤怠申請に成功しました。'
      redirect_to user_url(@user)
    else
      flash.now[:danger] = "勤怠申請に失敗しました。"
      render user_url(@user)
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end  
  
  private

    def apply_params
      params.require(:apply).permit(:superior_id, :member_id, :application_month, :status)
    end
end
