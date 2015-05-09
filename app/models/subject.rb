class Subject < ActiveRecord::Base
	has_many :chapters
end




RailsAdmin.config do |config| 
	config.model 'Subject' do
		edit do
			field :title do
      	label "新增科目名稱"
      end
		end
	end
end
