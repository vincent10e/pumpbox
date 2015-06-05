class CustomizedConcept < ActiveRecord::Base
  belongs_to :course
  has_many :tests, :dependent => :destroy
  accepts_nested_attributes_for :tests, :reject_if => lambda { |a| a[:question].blank? }
end
