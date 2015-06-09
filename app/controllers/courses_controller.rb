class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @customized_concepts = @course.customized_concepts
  end

  # GET /courses/new
  def new
    @teacher = current_user.teacher
    @course = @teacher.courses.build

    if params[:group_id]
      @group = Group.find(params[:group_id])
      @course_group = @group.course_groupships.create
      @course_group.course = @course
      @course_group.save
    end
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @teacher = current_user.teacher
    @course = @teacher.courses.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_students
    @course = Course.find(params[:course_id])
    @groups = @course.groups
  end

  def reports
    @course = Course.find(params[:course_id])
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # f.series(:name=>'John',:data=> [3, 20, 3, 5, 4, 10, 12 ])
      # f.series(:name=>'Jane',:data=>[1, 3, 4, 3, 3, 5, 4,-46] )     
      f.title({:text=>"example test title from controller"})
      f.options[:xAxis][:categories] = ['Alexander', 'Marie', 'Maximilian', 'Sophia', 'Lukas', 'Maria', 'Leon', 'Anna', 'Tim', 'Laura']
      f.options[:yAxis][:categories] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
      f.chart(:type => 'column', :marginTop => '40', :marginBottom => '80')
      f.legend(align: 'right',
            layout: 'vertical',
            margin: 0,
            verticalAlign: 'top',
            y: 25,
            symbolHeight: 280) 

      f.colorAxis(
            min: 0,
            minColor: '#FFFFFF'
        )
      f.series(name: 'Sales per employee',
            borderWidth: 1,
            data: [[0, 0, 10], [0, 1, 19], [0, 2, 8], [0, 3, 24], [0, 4, 67], [1, 0, 92], [1, 1, 58], [1, 2, 78], [1, 3, 117], [1, 4, 48], [2, 0, 35], [2, 1, 15], [2, 2, 123], [2, 3, 64], [2, 4, 52], [3, 0, 72], [3, 1, 132], [3, 2, 114], [3, 3, 19], [3, 4, 16], [4, 0, 38], [4, 1, 5], [4, 2, 8], [4, 3, 117], [4, 4, 115], [5, 0, 88], [5, 1, 32], [5, 2, 12], [5, 3, 6], [5, 4, 120], [6, 0, 13], [6, 1, 44], [6, 2, 88], [6, 3, 98], [6, 4, 96], [7, 0, 31], [7, 1, 1], [7, 2, 82], [7, 3, 32], [7, 4, 30], [8, 0, 85], [8, 1, 97], [8, 2, 123], [8, 3, 64], [8, 4, 84], [9, 0, 47], [9, 1, 114], [9, 2, 31], [9, 3, 48], [9, 4, 91]],dataLabels: {
                enabled: true,
                color: '#000000'
            })

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:education_level_id, :subject_id, :teacher_id, :title, :overview)
    end
end
