class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher, only: [:reports]

  # GET /courses
  # GET /courses.json
  def index
    @group = Group.find(params[:group_id])
    @courses = @group.courses

    @teacher = current_user.teacher
    @collect_courses = @teacher.collect_courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @customized_concepts = @course.customized_concepts

    
    @group = Group.find(params[:group_id]) if params[:group_id]
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
    @course = Course.find(params[:id])
    
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

  def concept_list
    @course = Course.find(params[:course_id])
    @customized_concepts = @course.customized_concepts
    respond_to do |format|
      format.js
    end  
  end

  def concept_map
    @course = Course.find(params[:course_id])
    @customized_concepts = @course.customized_concepts

    respond_to do |format|
      format.js
    end  
  end

  def list_students
    @course = Course.find(params[:course_id])
    @group = @course.group

    respond_to do |format|
      format.js
    end  
  end

  def reports
    @course = Course.find(params[:course_id])
    @concepts = @course.customized_concepts
    @group = @course.group
    @students = @group.students

    respond_to do |format|
      format.js
    end  
  end

  def course_filter
    @s_filter = params[:select_item][:subject_id]
    @v_filter = params[:select_volume][:volume_id]

    if @s_filter.count > 1 && @v_filter.count <= 1# user didn't select any subject, so return all of the courses
      @courses = Course.opened.where(subject_id: @s_filter).order(:title).page params[:page]
    elsif @s_filter.count <= 1 && @v_filter.count > 1
      @courses = Course.opened.where(volume_id: @v_filter).order(:title).page params[:page]
    else
      if @s_filter.count > 1 && @v_filter.count > 1
        @courses = Course.opened.where(subject_id: @s_filter, volume_id: @v_filter).order(:title).page params[:page]
      else
        @courses = Course.opened.order(:title).page params[:page]
      end
    end

    @target_courses = EducationLevel.all
    set_user
    respond_to do |format|
      format.html { render "prototypes/index" }
      format.js
    end  
  end

  def filter_by_level
    @target_courses = EducationLevel.all
    set_user

    @level = EducationLevel.find(params[:education_level_id])
    @subjects = @level.subjects
    @volumes = @level.volumes
    @courses = Course.opened.where(education_level_id: params[:education_level_id]).order(:title).page params[:page]

    respond_to do |format|
      format.html { render "prototypes/index" }
      format.js
    end
  end

  def change_status
    @course = Course.find(params[:course_id])

    @group = Group.find(params[:group_id])
    @courses = @group.courses

    @course.is_open = !@course.is_open #reverse is_open value

    if @course.save!
      respond_to do |format|
        format.html { redirect_to group_courses_path(@group) }
      end
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
    
    def set_user
      if user_signed_in?
        if current_user.has_role? :student
          @user = current_user.student
          @groups = @user.groups # To-Do : should modify the group which is student belongs to
        else
          @user = current_user.teacher
          @groups = @user.groups
          @subjects = Subject.all
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:education_level_id, :subject_id, :teacher_id, :title, :overview, :group_id, :volume_id, :image, :is_open, :build_teacher_id)
    end
end
