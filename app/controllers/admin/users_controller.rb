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

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path }
        format.json { render :show, status: :created, location: admin_users_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path }
        format.json { render :show, status: :ok, location: admin_users_path }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
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
