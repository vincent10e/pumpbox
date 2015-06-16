class Subject < ActiveRecord::Base
  belongs_to :education_level
	has_many :chapters, :dependent => :destroy
	has_many :concepts, :dependent => :destroy
  validates :title, presence: true
end




RailsAdmin.config do |config| 
	config.model 'Subject' do
		edit do
      field :education_level do
        label "選擇所屬課程對象"
      end
			field :title do
      	label "新增科目名稱"
      end
		end

    weight 2 # for nav order 
	end
end
