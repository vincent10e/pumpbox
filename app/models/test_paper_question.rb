class TestPaperQuestion < ActiveRecord::Base
  belongs_to :customized_concept

  mount_uploader :question, QuestionUploader
end
