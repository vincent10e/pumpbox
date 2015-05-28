class Subject < ActiveRecord::Base
  belongs_to :target_course
	has_many :chapters
	has_many :concepts
  validates :title, presence: true
end




RailsAdmin.config do |config| 
	config.model 'Subject' do
		edit do
      field :target_course do
        label "選擇所屬課程對象"
      end
			field :title do
      	label "新增科目名稱"
      end
		end

    weight 2 # for nav order 
	end
end
