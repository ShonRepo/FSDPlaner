class TodosController < ApplicationController

  def update
    @Project = Project.find(params[:project_id])
    @Todo = @Project.todos.find(params[:id])
    @Todo.update(isCompleted: !@Todo.isCompleted)
  end

  def create
    prod = {project: { title: project_params[:title],
                      todos_attributes: [ {text: todo_params[:text], isCompleted: false } ] } }
    unless params[:project_id]
      Project.create(prod[:project])
    else
      @Todo = Project.find(params[:project_id]).todos.create(prod[:project][:todos_attributes]);
    end
  end
  private

  def todo_params
    params.permit(:text)
  end
  def project_params
    params.permit(:title)
  end
end
