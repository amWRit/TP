class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :status, :title,:project_id
  validates :title, :presence => true, :length =>{:minimum =>5}
  belongs_to :project
end
