class TodosController < ApplicationController
  before_action :set_project, only: [:update]

  def update
    @Todo = @Project.todos.find(params[:id])
    @Todo[:isCompleted] = !@Todo[:isCompleted]
    if @Todo.save
      render json: @Todo
    else
      render json: {message: 'error'}
    end
  end

  def create

    if !params[:project_id]
      @Project = Project.create(project_params)
      if @Project.save
      else
        render json: {message: 'error create project'}
      end

    else
      set_project
    end

    @Todo = @Project.todos.create(todo_params)
    @Todo[:isCompleted] = false
    if @Todo.save
      render json: @todo
    else
      render json: {message: 'error create project'}
    end

  end

  private

  def set_project
    @Project = Project.find(params[:project_id])
  end

  def todo_params
    params.permit(:text)
  end
  def project_params
    params.permit(:title)

  end
end
