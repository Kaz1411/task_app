class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @count = Task.count
    @date = Date.current.strftime('%Y年%m月%d日')
  end

  def new
    @task = Task.new
    @date = Date.current.strftime('%Y年%m月%d日')
  end

  def create
    @task = Task.new(params.require(:task).permit(:title,:start_day,:end_day,:all_day,:memo))
    @date = Date.current.strftime('%Y年%m月%d日')
    if @task.save
      flash[:success] = "スケジュールを新規登録しました"
      redirect_to :tasks
    else
      flash[:failure] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
    @date = Date.current.strftime('%Y年%m月%d日')
  end

  def edit
    @task = Task.find(params[:id])
    @date = Date.current.strftime('%Y年%m月%d日')
  end

  def update
    @task = Task.find(params[:id])
    @date = Date.current.strftime('%Y年%m月%d日')
    if @task.update(params.require(:task).permit(:title,:start_day,:end_day,:all_day,:memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:failure] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end

end
