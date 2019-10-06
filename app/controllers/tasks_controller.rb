class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :check_login

  def index
		# 検索
    @tasks = Task.search(params[:task_name], params[:status], session[:user_id])
    # 検索条件を保持
		@search_cond = {task_name: params[:task_name], status: params[:status]}

		# 並び替え
		if params[:sort].present?
			@tasks = @tasks.order(params[:sort] + " "  + params[:sort_d])
		else
			@tasks = @tasks.order(created_at: "desc")
		end

		# ページネーション
    @tasks = @tasks.page(params[:page]).per(10)
  end

  def show
  end

  def new
		@task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = t 'flash.create'
      redirect_to @task
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:success] = t 'flash.update'
      redirect_to @task
    else
      render :edit
    end
  end

	def destroy
    if @task.destroy
      flash[:success] = t 'flash.delete'
      redirect_to tasks_path
    end
  end
 
  # ログイン中でなければログイン画面へリダイレクト
  def check_login
    redirect_to login_path if !logged_in?
  end


	private

    # リクエストパラメータから値を取得
		def task_params
      params[:task][:user_id] = session[:user_id]
      params.require(:task).permit(:task_name, :content, :limit_date, :status, :priority, :user_id)
		end

    # idからタスクを取得
    def set_task
      @task = Task.find(params[:id])
    end
end
