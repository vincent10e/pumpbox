class PrototypeController < ApplicationController

  def index
    @username = '郭柏廷'
    @level = rand 99
    @money = rand 9999
  end

end
