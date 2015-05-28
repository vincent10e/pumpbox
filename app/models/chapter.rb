class Chapter < ActiveRecord::Base
	belongs_to :subject
	has_many :concepts
  validates :subject_id, :volume_number, :title, :description, presence: true
end


RailsAdmin.config do |config| 
	config.model 'Chapter' do
		edit do
			field :subject do
      	label "選擇所屬科目"
      end
			field :volume_number do
        label "選擇所屬冊別"
      end
      field :title do
      	label "章節名稱"
      end
      field :description do
      	label "章節敘述"
      end
		end

		weight 3 # for nav order 
	end
end