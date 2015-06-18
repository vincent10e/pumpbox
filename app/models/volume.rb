class Volume < ActiveRecord::Base
  belongs_to :education_level
  has_many :subjects, :dependent => :destroy
end



RailsAdmin.config do |config| 
  config.model 'Volume' do
    edit do
      field :education_level do
        label "選擇所屬課程對象"
      end
      field :title do
        label "冊名"
      end
      field :number do
        label "冊數"
      end
    end

    weight 2 # for nav order 
  end
end
