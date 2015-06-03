class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :courses, :dependent => :destroy
  has_many :groups, :dependent => :destroy
end
