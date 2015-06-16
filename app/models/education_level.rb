class EducationLevel < ActiveRecord::Base
  has_many :courses
  has_many :subjects, :dependent => :destroy
end
