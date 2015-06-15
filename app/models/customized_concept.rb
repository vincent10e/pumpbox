class CustomizedConcept < ActiveRecord::Base
  belongs_to :course
  has_many :tests, :dependent => :destroy
  accepts_nested_attributes_for :tests, :reject_if => lambda { |a| a[:question].blank? }
  has_many :test_attempts, :dependent => :destroy

  mount_uploader :lecture, LectureUploader
end
