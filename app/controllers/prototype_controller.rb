class PrototypeController < ApplicationController

  def index
    @username = '郭柏廷'
    @level = rand 9
    @money = rand 999
    @school = '中山國中'
    @grade = '八年級'
  end

end
