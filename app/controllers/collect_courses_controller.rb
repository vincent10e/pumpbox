class CollectCoursesController < ApplicationController
  before_action :set_collect_course, only: [:show, :edit, :update, :destroy]

  # GET /collect_courses
  # GET /collect_courses.json
  def index
    @collect_courses = CollectCourse.all
  end

  # GET /collect_courses/1
  # GET /collect_courses/1.json
  def show
  end

  # GET /collect_courses/new
  def new
    @collect_course = CollectCourse.new
  end

  # GET /collect_courses/1/edit
  def edit
  end

  # POST /collect_courses
  # POST /collect_courses.json
  def create
    @collect_course = CollectCourse.new(collect_course_params)

    respond_to do |format|
      if @collect_course.save
        format.html { redirect_to @collect_course, notice: 'Collect course was successfully created.' }
        format.json { render :show, status: :created, location: @collect_course }
      else
        format.html { render :new }
        format.json { render json: @collect_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collect_courses/1
  # PATCH/PUT /collect_courses/1.json
  def update
    respond_to do |format|
      if @collect_course.update(collect_course_params)
        format.html { redirect_to @collect_course, notice: 'Collect course was successfully updated.' }
        format.json { render :show, status: :ok, location: @collect_course }
      else
        format.html { render :edit }
        format.json { render json: @collect_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collect_courses/1
  # DELETE /collect_courses/1.json
  def destroy
    @collect_course.destroy
    respond_to do |format|
      format.html { redirect_to collect_courses_url, notice: 'Collect course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join_list
    @course = Course.find(params[:course_id])
    @collect_course = CollectCourse.new(@course.to_hash)
    @collect_course.teacher_id = current_user.teacher.id  #owner : teacher_id, builder : build_teacher_id
    @collect_course.build_teacher_id = @course.teacher_id
    @collect_course.original_course_id = @course.id

    respond_to do |format|
      if @collect_course.save
        format.js
      end
    end
  end

  def join_group
    @teacher = current_user.teacher
    @group = Group.find(params[:group_id])
    @collect_course = CollectCourse.find(params[:collect_course_id])
    @original_course = Course.find(@collect_course.original_course_id)


    @course = Course.new(@collect_course.to_hash)
    @course.group_id = @group.id
    @course.is_collect = true
    
    # @course.image = File.open(@collect_course.image.path) if !@collect_course.image.nil?
    
    respond_to do |format|
      if @course.save
        copy_concept(@course, @collect_course, @original_course)
        format.html { redirect_to group_courses_path(@group) }
      end
    end
  end

  def copy_concept(new_course, collect_course, original_course)
    original_course.customized_concepts.each do|concept|
      copy_concept = new_course.customized_concepts.new
      copy_concept = concept.dup
      copy_concept.course_id = new_course.id
      copy_concept.save
      if concept.test_paper_questions
        copy_test_paper(copy_concept, concept)
      end
    end
  end

  def copy_test_paper(new_concenpt, original_concept)
    original_concept.test_paper_questions.each do |question|
      copy_question = new_concenpt.test_paper_questions.new
      copy_question = question.dup
      copy_question.customized_concept_id = new_concenpt.id
      copy_question.question = File.open(question.question.path)
      copy_question.save
      copy_test_paper_option(copy_question, question)
    end
  end

  def copy_test_paper_option(new_question, original_question)
    original_question.test_paper_options.each do |option|
      copy_option = new_question.test_paper_options.new
      copy_option = option.dup
      copy_option.test_paper_question_id = new_question.id
      copy_option.save
    end
  end

  def copy_test(new_concenpt, original_concept)
    original_concept.tests.each do |test|
      copy_test = new_concenpt.tests.new
      copy_test = original_question.dup
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collect_course
      @collect_course = CollectCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collect_course_params
      params.require(:collect_course).permit(:teacher_id, :title, :overview, :education_level_id, :subject_id, :group_id, :volume_id, :image, :is_open)
    end
end
