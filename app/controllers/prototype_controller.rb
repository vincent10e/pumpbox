class PrototypeController < ApplicationController

  def index
    fake_data
  end

  private

  def fake_data
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
          '連心線'
        ]
      }
    @courses = {
        title: '初階測距術',
        status: 2, # 0: locked, 1: available, 2: passed
        description: '敘述',
        sub_titles: [
          '子關卡1',
          '子關卡2',
          '子關卡3'
        ],
        exp: 3000,
        money: 1
      },{
        title: '圓與圓的關係',
        status: 1, # 0: locked, 1: available, 2: passed
        description: '了解圓與圓之間的基本關係，未來可以應用到齒輪設計等機械相關技能，可以設計出更省時省力的工具！',
        sub_titles: [
          '相切',
          '連心線',
          '公切線'
        ],
        exp: 3000,
        money: 1
      },{
        title: '切線應用',
        status: 0, # 0: locked, 1: available, 2: passed
        description: '敘述',
        sub_titles: [
          '子關卡1',
          '子關卡2',
          '子關卡3'
        ],
        exp: 3000,
        money: 1
      },{
        title: '切線應用',
        status: 0, # 0: locked, 1: available, 2: passed
        description: '敘述',
        sub_titles: [
          '子關卡1',
          '子關卡2',
          '子關卡3'
        ],
        exp: 3000,
        money: 1
      }
  end

end
