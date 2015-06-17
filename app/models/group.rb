class Group < ActiveRecord::Base
  belongs_to :teacher

  has_many :courses, :dependent => :destroy
  
  has_many :student_groupships
  has_many :students, :through => :student_groupships
  validates :group_code, :presence => true
end
