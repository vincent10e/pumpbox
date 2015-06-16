class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :customized_concepts
  has_many :course_groupships
  has_many :groups, :through => :course_groupships

  paginates_per 9
end
