class Test < ActiveRecord::Base
  belongs_to :concept
  has_many :options, :dependent => :destroy, :inverse_of => :test
  accepts_nested_attributes_for :options, :allow_destroy => true

  validates :concept, :question, presence: true
end




RailsAdmin.config do |config| 

  config.model 'Test' do
    edit do
      field :concept do
        label "選擇所屬觀念"
      end
      field :question do
        label "輸入題目"
      end
      field :tip do
        label "提示"
      end
      field :related_video do
        label "補救影片連結"
      end
      field :options do
      end
      
    end

    # list do
    #   field :concept
    #   field :answer
    #   field :tip
    # end

    weight 5 # for nav order 
  end
end

RailsAdmin.config do |config| 
  config.model 'Option' do
    edit do
      field :test_id do

      end
      field :is_answer do
        label "是否為答案"
      end
      field :description do
        label "選項描述"
      end
    end

    weight 3  # for nav order 
  end
end

