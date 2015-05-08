class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  as_enum :grade, 一年級: 1, 二年級: 2, 三年級: 3, 四年級: 4, 五年級: 5, 六年級: 6, 七年級: 7, 八年級: 8
end
