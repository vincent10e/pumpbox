class Student < ActiveRecord::Base
  belongs_to :user
  has_many :student_groupships
  has_many :groups, :through => :student_groupships
end
