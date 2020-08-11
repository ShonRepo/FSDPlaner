class ProjectSerializer < ActiveModel::Serializer
  attributes :id,:title
  belongs_to :todos
end

class TodoSerializer < ActiveModel::Serializer
  attributes :text, :isCompleted
end
