class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :education_level
  belongs_to :group
  has_many :customized_concepts, :dependent => :destroy

  mount_uploader :image, CouseImageUploader
  paginates_per 9

end
