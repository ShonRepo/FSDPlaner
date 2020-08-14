class Project < ApplicationRecord
  has_many :todos,  dependent: :destroy

 accepts_nested_attributes_for :todos
  validates :title, presence: true
end
