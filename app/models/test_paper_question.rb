class TestPaperQuestion < ActiveRecord::Base
  belongs_to :customized_concept
  has_many :test_paper_options, :dependent => :destroy
  accepts_nested_attributes_for :test_paper_options, :reject_if => lambda { |a| a[:answer].blank? }

  mount_uploader :question, QuestionUploader

  # For gem 'acts-as-taggable-on'
  acts_as_taggable
end
