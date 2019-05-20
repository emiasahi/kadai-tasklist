class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks
  end
  
  def show
  end
  
  def new
    # @task = current_user.tasks.build
    @task = Task.new
    @task.user = current_user
  end
  
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    
    if @task.save       
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else 
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
      if @task.update(task_params)
        flash[:success] = 'タスクは正常に更新されました'
        redirect_to @task
      else 
        flash[:danger] = 'タスクは正常に更新されませんでした'
        render :edit
      end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  # Strong Parameter
  def set_task
    # データが無い場合にはnilを返す
    @task = Task.find_by(id: params[:id])
  end
  def check_user
    # correct_userというメソッドでカリキュラムでは書いている。
    if @task.blank? or @task.user != current_user
      redirect_to root_url
    end
  end
  def task_params
    params.require(:task).permit(:content, :status)
  end
end

