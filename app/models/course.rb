class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :education_level
  has_many :customized_concepts, :dependent => :destroy
  has_many :course_groupships
  has_many :groups, :through => :course_groupships

  paginates_per 9
end
