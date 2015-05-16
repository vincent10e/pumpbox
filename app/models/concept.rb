class Concept < ActiveRecord::Base
	belongs_to :subject
	belongs_to :volume
	belongs_to :chapter
end


RailsAdmin.config do |config| 
	config.model 'Concept' do
		edit do
			field :subject do
      	label "選擇所屬科目"
      end
			field :volume_number do
        label "選擇所屬冊別"
      end
      field :chapter do
      	label "選擇所屬章節"
      end
      field :title do
      	label "觀念名稱"
      end
      field :description do
      	label "觀念敘述"
      end
      field :video do
      	label "影片連結"
      end
		end

		weight 3  # for nav order 
	end
end


