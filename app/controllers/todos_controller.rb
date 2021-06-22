class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to('/todos/index')
  end

  def new
    @todo = Todo.new(todo: params[:todo], status: FALSE)

    if @todo.save
      redirect_to('/todos/index')
    else
      @todos = Todo.all
      render('/todos/index')
    end
  end

  def update_form
    @todo = Todo.find_by(id: params[:id])
  end

  def update
    @todo = Todo.find_by(id: params[:id])

    @todo.todo = params[:todo] if params[:todo]
    
    if @todo.save
      redirect_to('/todos/index')
    else
      render("todos/update_form")
    end
  end

  def update_status
    @todo = Todo.find_by(id: params[:id])

    @todo.status = @todo.status ? FALSE : TRUE
    @todo.save
    redirect_to('/todos/index')
  end

end
