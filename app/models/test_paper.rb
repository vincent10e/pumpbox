class TestPaper < ActiveRecord::Base
  belongs_to :customized_concept

  has_many :paper_answer_records, :dependent => :destroy
  accepts_nested_attributes_for :paper_answer_records, :reject_if => lambda { |a| a[:test].blank? }

  after_save :send_point, only: :create


  protected

  def send_point
    # It's only one retry_time == 1 will send point to student
    if self.retry_time == 1
      @customized_concept = CustomizedConcept.find(self.customized_concept_id)
      @student = Student.find_by_user_id(self.user)
      @student.point += @customized_concept.point
      @student.save
    end
  end
end
