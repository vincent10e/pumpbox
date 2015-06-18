class TestAttempt < ActiveRecord::Base
  belongs_to :customized_concept

  has_many :answer_records, :dependent => :destroy
  # accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :answer_records, :reject_if => lambda { |a| a[:test].blank? }
end
