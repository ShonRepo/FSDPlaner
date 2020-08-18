class TodosController < ApplicationController

  def update
    render json: Todo.update(params[:id], isCompleted: params[:isCompleted])
  end

  def create
    prod = { project: {title: params[:title],
                      todos_attributes: [ {text: params[:text], isCompleted: false} ] } }
    if params[:project_id]
      Project.update(params[:project_id], prod[:project])
    else
      Project.create!(prod[:project])
    end

  end
  private

  def todo_params
    params.permit(:text, :isCompleted)
  end
  def project_params
    params.permit(project: {:title, todos_attributes: [{:text, :isCompleted}]})
  end
end
