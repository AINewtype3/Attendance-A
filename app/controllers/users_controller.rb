class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :update_basic_info]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info]
  before_action :admin_or_correct_user, only: [:show]
  before_action :set_one_month, only: :show
  
  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
  end
  
  def at_work
    @atwork_users_employee_number = []
    @atwork_users = []
    User.all.each do |user|
      if user.attendances.any?{|day|
         ( day.worked_on == Date.current &&
           !day.started_at.blank? &&
           day.finished_at.blank? )
          }
        @atwork_users_employee_number.push(user.employee_number)
        @atwork_users.push(user.name)
      end
    end 
  end
  
  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
    @superior_users = User.superior_users
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :index
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end

  def update_basic_info
  end
  
  def import
    User.import(params[:file])
    redirect_to users_path
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :affiliation, :employee_number, :uid, :password, 
      :basic_work_time, :designated_work_start_time, :designated_work_end_time)
    end
    
end
