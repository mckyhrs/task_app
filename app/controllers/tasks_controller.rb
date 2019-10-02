class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
		# 検索
		@tasks = Task.search(params[:task_name], params[:status])
		@search_cond = {task_name: params[:task_name], status: params[:status]}

		# 並び替え
		if params[:sort].present?
			@tasks = @tasks.order(params[:sort] + " "  + params[:sort_d])
		else
			@tasks = @tasks.order(created_at: "desc")
		end

		# ページネーション
		@tasks = @tasks.page(params[:page]).per(5)
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

    respond_to do |format|
      if @task.save
				flash_msg = t 'flash.create'
        format.html { redirect_to @task, notice: flash_msg}
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
				flash_msg = t 'flash.update'
        format.html { redirect_to @task, notice: flash_msg }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    @task.destroy
    respond_to do |format|
			flash_msg = t 'flash.delete'
      format.html { redirect_to tasks_url, notice: flash_msg }
      format.json { head :no_content }
    end
	end

	private

		def task_params
			params.require(:task).permit(:task_name, :content, :limit_date, :status, :priority)
		end

    def set_task
      @task = Task.find(params[:id])
    end
end
