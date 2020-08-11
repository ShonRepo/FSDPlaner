class TodosController < ApplicationController
  before_action :set_project, only: [:update]

  def update
    @Todo = @Project.todos.find(params[:id])
    @Todo[:isCompleted] = !@Todo[:isCompleted]
    if @Todo.save

    else
      render json: {message: 'error'}
    end
  end

  def create
    if(params[:project_id] == 0)
      @Project = Project.create(project_params)
      if @Project.save
        render @Project
      else
        render json: {message: 'error create project'}
      end

    else
      set_project
    end

    @Todo = @Project.todos.create(todo_params)
    if @Todo.save
      render @todo
    else
      render json: {message: 'error create project'}
    end

  end

  private

  def set_project
    @Project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:text,:isCompleted)
  end
  def project_params
    params.require(:project).permit(:title)

  end
end
