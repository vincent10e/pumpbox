class PrototypesController < ApplicationController

  before_action :fake_data
  before_action :load_student_as_user

  def index
    @courses = Course.where(is_open: true).order(:title).page params[:page] # To - DO : it should display the course which is set to opened.
    @target_courses = EducationLevel.all
    if current_user.has_role? :student
      @user = current_user.student
      @groups = @user.groups # To-Do : should modify the group which is student belongs to
    else
      @user = current_user.teacher
      @groups = @user.groups
      @subjects = Subject.all
    end
    
  end

  def course_filter
    @list_courses
    respond_to do |format|
      format.js
    end  
  end

  def landing_page
    @courses = Course.where(is_open: true).order(:title).page params[:page]
    @target_courses = EducationLevel.all
    @subjects = Subject.all
  end

  def course
  end

  def rank
  end

  def mission_center
  end

  def mission_danger
  end

  def test
  end

  def special_test
  end

  def result_maru
  end

  def result_batsu
  end

  private

  def load_student_as_user
    @user = current_user
  end

  def fake_data
    @username = '郭柏廷'
    @level = rand 9
    @exp = rand 99999
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
        id: 1,
        title: '提公因式法',
        path: '/test/12',
        status: 2, # 0: locked, 1: available, 2: passed
        description: '提公因式法的主要概念是使用分配率。',
        sub_titles: [

        ],
        exp: 3000,
        money: 1
      },{
        id: 2,
        title: '十字交乘法',
        path: '/test/14',
        status: 1, # 0: locked, 1: available, 2: passed
        description: '十字交乘法是作因式分解時很重要的一項工具，主要是由多項式的直式乘法發展而來，藉由係數的分解組合，求得因式分解的過程',
        sub_titles: [

        ],
        exp: 3000,
        money: 1
      },{
        id: 3,
        title: '乘法公式法',
        path: '/test/14',
        status: 1, # 0: locked, 1: available, 2: passed
        description: '因式分解的「乘法公式法」，主要是利用先前章節教過的乘法公式作對照，使多項式能夠以相對應的型式整理並作分解。',
        sub_titles: [

        ],
        exp: 3000,
        money: 1
      },{
        id: 4,
        title: '切線應用',
        status: 0, # 0: locked, 1: available, 2: passed
        description: '敘述',
        sub_titles: [
          'test1',
          'test2',
          'test3'
        ],
        exp: 3000,
        money: 1
      }
    @video_url = 'https://www.youtube.com/watch?v=uy-6T1D_2TI'
  end

end
