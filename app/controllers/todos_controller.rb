class TodosController < ApplicationController
  def index
    @todos = Todo.all.where(user_id: current_user.id).order(id: :desc)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    if @todo.save
      redirect_to url_for(action: :index), notice: '作成に成功しました'
    else
      flash.now[:danger] = '作成に失敗しました'
      render :new
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to url_for(action: :index), notice: '削除に成功しました'
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :content)
  end
end
