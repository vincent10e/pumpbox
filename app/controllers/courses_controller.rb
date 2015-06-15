class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher, only: [:reports]

  # GET /courses
  # GET /courses.json
  def index
    @group = Group.find(params[:group_id])
    @courses = @group.courses
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
    @group = Group.find(params[:group_id])
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
    @concepts = @course.customized_concepts
    @group = @course.groups.find_by(teacher_id: @teacher.id)
    @students = @group.students
  end

  def course_filter
    @list_courses = Course.where(subject_id: params[:select_item][:subject_id])
  
    respond_to do |format|
      format.js
    end  
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_teacher
      @teacher = current_user.teacher
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:education_level_id, :subject_id, :teacher_id, :title, :overview)
    end
end
