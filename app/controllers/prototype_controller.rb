class PrototypeController < ApplicationController

  def index
    @username = '郭柏廷'
    @level = rand 9
    @money = rand 999
    @school = '中山國中'
    @grade = '八年級'
    @skills = {
        title: '初階測距術',
        learned: [
          '角度測量',
          '內角與外角',
          '多邊形內角'
        ]
      },{
        title: '圓與圓的關係',
        learned: [
          '相切',
          '連心線',
          '公切線'
        ]
      }
  end

end
