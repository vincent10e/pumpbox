class TestPaper < ActiveRecord::Base
  belongs_to :customized_concept

  has_many :paper_answer_records, :dependent => :destroy
  accepts_nested_attributes_for :paper_answer_records, :reject_if => lambda { |a| a[:test].blank? }
end
