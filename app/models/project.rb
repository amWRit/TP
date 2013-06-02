class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title, :student_id
  validates :title, :presence => true, :length => {:minimum =>5}
  validates :description, :presence =>true 
  has_many :tasks, :dependent => :destroy
  belongs_to :student
end
