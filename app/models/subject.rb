class Subject < ActiveRecord::Base
	has_many :chapters
	has_many :concepts
  validates :title, presence: true
end




RailsAdmin.config do |config| 
	config.model 'Subject' do
		edit do
			field :title do
      	label "新增科目名稱"
      end
		end

    weight 1 # for nav order 
	end
end
