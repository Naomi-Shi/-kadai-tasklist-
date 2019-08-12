class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :check_user, only: [:show, :edit, :update, :destroy]
  # before_action :current_user, only: [:edit, :destroy]

	def index
		if logged_in?
			@task = current_user.tasks.build
			@tasks = current_user.tasks.order(id: :desc).page(params[:page])
		end
	end
	
	def show
	end
	
	def new
		@task = Task.new
	end
  
  def create
  	@task = current_user.tasks.build(task_params)
     #tasksメソッドでuserに紐づいた投稿ができるようにする
  	if @task.save
  		flash[:succcess] = 'Taskが正常に投稿されました'
  		redirect_to @task
  	else
  		flash.now[:danger] ='Taskが投稿されませんでした'
  		render :new
  	end
  end
  
  def edit
  end
  
  def update
  	if @task.update(task_params)
  		flash[:success] = 'Taskは正常に更新されました'
  		redirect_to @task
  	else
  		flash.now[:danger] ='Taskは更新されませんでした'
  		render :edit
  	end
  end
  
  def destroy
  	@task.destroy
  	
  	flash[:success] = 'Taskは正常に削除されました'
  	redirect_to tasks_url
  end
  
  private
  
  def task_params
  	params.require(:task).permit(:content, :status)
  end
  
  def check_user
  	@task = Task.find_by(id: params[:id])
  	redirect_to root_url if @task.blank? || @task.user != current_user
  end
  #@taskが空か、または、@task.useがcurrent_userではない場合にリダイレクトする。
  #findだと空の場合にエラーになってしまう。だから、find_byを使って空の場合でも権限がない場合でも同じ表示となるようにする。
  #findとfind_byの違いももう一度復習
  
#  def correct_user
#  	@task = current_user.tasks.find_by(id: params[:id])
#  	unless @task
#  	  redirect_to tasks_url
#  	end
#  end
end