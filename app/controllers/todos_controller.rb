class TodosController < ApplicationController
  def index
    @todos = Todo.all.order(id: :desc)
    respond_to do |format|
      format.json { render json: @todos }
    end
  end

  def show
    p params
    @todo = Todo.find(params[:id])
    respond_to do |format|
      if @todo
        format.json { render json: @todo }
      else
        render :json => { :errors => @todo.errors.messages }, :status => 422
      end
    end
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      format.json do
        if @todo.save
          render :json => @todo
        else
          render :json => { :errors => @todo.errors.messages }, :status => 422
        end
      end
    end
  end

  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      format.json do
        if @todo.update(todo_params)
          render :json => @todo
        else
          render :json => { :errors => @todo.errors.messages }, :status => 422
        end
      end
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:text)
  end
end
