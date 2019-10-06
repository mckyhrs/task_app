class Admin::UsersController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :check_admin

  def index
      @users = User.eager_load(:tasks).all.order(id: "asc")
  end
  
  def new
      @user = User.new
  end
  
  def edit
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = t 'flash.create'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = t 'flash.update'
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      flash[:success] = t 'flash.delete'
      redirect_to admin_users_path
    end
  end

  # ログアウト状態、またはログインユーザーが管理ユーザー権限を持っていない場合は、専用の例外を表示
  def check_admin
    # FIXME: 例外表示を実装する
    redirect_to tasks_path if !logged_in? || !current_user.admin?
  end

  private

    # リクエストパラメータから値を取得
    def user_params
      params.require(:user).permit(:user_name, :login_id, :password, :role)
    end

    # idからユーザーを取得
    def set_user
      @user = User.find(params[:id])
    end
end
