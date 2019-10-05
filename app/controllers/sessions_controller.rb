class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_id: params[:session][:login_id])
    if user && user.authenticate(params[:session][:password])
      # ログイン成功の場合、タスク一覧を表示
      log_in user
      redirect_to controller: :tasks, action: :index 
    else
      # ログイン失敗の場合、エラーメッセージを表示
      flash.now[:danger] = t('errors.login_invalid')
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
