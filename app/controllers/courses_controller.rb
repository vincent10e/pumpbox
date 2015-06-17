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
    @course.group_id = params[:group_id]

    @group = Group.find(params[:group_id])
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @group = @course.group
    @teacher = current_user.teacher
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to teacher_group_path(@teacher, @group), notice: 'Course was successfully created.' }
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
    @group = Group.find(params[:course][:group_id])
    @teacher = current_user.teacher

    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to group_courses_path(@group), notice: 'Course was successfully updated.' }
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
    @course = Course.find(params[:id])
    @group = @course.group
    @teacher = current_user.teacher
    @course.destroy
    respond_to do |format|
      format.html { redirect_to group_courses_path(@group), notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_students
    @course = Course.find(params[:course_id])
    @group = @course.group
  end

  def reports
    @course = Course.find(params[:course_id])
    @concepts = @course.customized_concepts
    @group = @course.group
    @students = @group.students
  end

  def course_filter
    if params[:select_item][:subject_id].count > 1 # user didn't select any subject, so return all of the courses
      @list_courses = Course.where(subject_id: params[:select_item][:subject_id]).order(:title).page params[:page]
    else
      @list_courses = Course.all.order(:title).page params[:page]
    end
    respond_to do |format|
      format.js
    end  
  end

  def filter_by_level
    @level = EducationLevel.find(params[:education_level_id])
    @subjects = @level.subjects
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
      params.require(:course).permit(:education_level_id, :subject_id, :teacher_id, :title, :overview, :group_id)
    end
end
