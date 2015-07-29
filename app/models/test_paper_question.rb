class TestPaperQuestion < ActiveRecord::Base
  belongs_to :customized_concept
  has_many :test_paper_options, :dependent => :destroy
  accepts_nested_attributes_for :test_paper_options, :reject_if => lambda { |a| a[:answer].blank? }

  mount_uploader :question, QuestionUploader

  # For gem 'acts-as-taggable-on'
  acts_as_taggable

  after_create :add_tag



  def add_tag
    self.tag_list.add(self.customized_concept.title, 
                     self.customized_concept.course.title, 
                     Volume.find(self.customized_concept.course.volume_id).title
                     )
  end

  def total_test
    test_paper_options.count
  end
end
