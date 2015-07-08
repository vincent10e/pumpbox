class CollectCourse < ActiveRecord::Base
  belongs_to :teacher

  mount_uploader :image, CouseImageUploader

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
end
