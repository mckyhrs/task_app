module SessionsHelper

  # ログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログイン中のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログイン中であればtrue、それ以外はfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end