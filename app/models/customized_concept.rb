class CustomizedConcept < ActiveRecord::Base
  belongs_to :course
  has_many :tests, :dependent => :destroy
  accepts_nested_attributes_for :tests, :reject_if => lambda { |a| a[:question].blank? }

  has_many :test_paper_questions, :dependent => :destroy
  accepts_nested_attributes_for :test_paper_questions, :reject_if => lambda { |a| a[:question].blank? }
  
  
  has_many :test_attempts, :dependent => :destroy
  has_many :test_papers, :dependent => :destroy

  mount_uploader :lecture, LectureUploader
  paginates_per 1

  def next(course_id)
    self.class.where("id > ? AND course_id = ?", id, course_id).first
  end

  def previous(course_id)
    self.class.where("id < ? AND course_id = ?", id, course_id).last
  end
end
