class AppliesController < ApplicationController
  
  def index
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
    end
      flash.now[:danger] = "勤怠申請に失敗しました。"
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
