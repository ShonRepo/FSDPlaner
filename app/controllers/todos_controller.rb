class TodosController < ApplicationController

  def update
    Todo.update(params[:id], isCompleted: params[:isCompleted])
  end

  def create
    if params[:project_id]
      Project.update(params[:project_id],project_params)
    else
      Project.create(project_params)
    end
  end
  private
  def todo_params
    params.permit(:text, :isCompleted)
  end
  def project_params
    params.permit(:title, todos_attributes: [:text, :isCompleted])
  end
end
