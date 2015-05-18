class Test < ActiveRecord::Base
  mount_uploader :question, QuestionUploader
  belongs_to :concept
  
end




RailsAdmin.config do |config| 

  config.model 'Test' do
    edit do
      field :concept do
        label "選擇所屬觀念"
      end
      field :question do
        label "選擇題目檔案"
      end
      field :option_1 do
        label "A選項"
      end
      field :option_2 do
        label "B選項"
      end
      field :option_3 do
        label "C選項"
      end
      field :option_4 do
        label "D選項"
      end
      field :answer do
        label "答案"
      end
      field :tip do
        label "提示"
      end
      
    end

    list do
      field :concept
      field :answer
      field :tip
    end

    weight 3 # for nav order 
  end
end

# RailsAdmin.config do |config| 
#   config.model 'Option' do
#     edit do
#       field :test_id do

#       end
#       field :is_answer do
#         label "是否為答案"
#       end
#       field :description do
#         label "選項描述"
#       end
#     end

#     weight 3  # for nav order 
#   end
# end

