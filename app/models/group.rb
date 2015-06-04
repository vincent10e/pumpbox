class Group < ActiveRecord::Base
  belongs_to :teacher
  has_many :course_groupships
  has_many :courses, :through => :course_groupships
  
  has_many :student_groupships
  has_many :students, :through => :student_groupships
  validates :group_code, :presence => true
end
