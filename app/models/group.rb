class Group < ActiveRecord::Base
  belongs_to :teacher
  has_many :course_groupships
  has_many :courses, :through => :course_groupships
end
