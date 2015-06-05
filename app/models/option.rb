class Option < ActiveRecord::Base
 belongs_to :test

  RailsAdmin.config do |config| 
    config.model 'Option' do
      edit do
        
        field :description do
          label "選項內容"
        end
        field :is_answer do
          label "是否為答案"
        end
      end

      weight 6  # for nav order 
    end
  end
end
