class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :education_level
  belongs_to :group
  has_many :customized_concepts, :dependent => :destroy

  mount_uploader :image, CouseImageUploader
  paginates_per 9

  def to_hash
    {:teacher_id => self.teacher_id, 
     :title => self.title, 
     :overview => self.title, 
     :education_level_id => self.education_level_id, 
     :subject_id => self.subject_id, 
     :volume_id => self.volume_id,
     :image => self.image
    }
  end

  scope :opened, -> { where(is_open: true) }
end
