class EducationLevel < ActiveRecord::Base
  has_many :courses
  has_many :subjects, :dependent => :destroy
  has_many :volumes, :dependent => :destroy
end
