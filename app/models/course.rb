class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :customized_concepts
end
