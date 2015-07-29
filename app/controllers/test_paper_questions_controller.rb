class TestPaperQuestionsController < ApplicationController
  before_action :set_test_paper_question, only: [:show, :edit, :update, :destroy]

  # GET /test_paper_questions
  # GET /test_paper_questions.json
  def index
    @test_paper_questions = TestPaperQuestion.all
  end

  # GET /test_paper_questions/1
  # GET /test_paper_questions/1.json
  def show
  end

  # GET /test_paper_questions/new
  def new
    @customized_concept = CustomizedConcept.find(params[:customized_concept_id])
    @test_paper_question = @customized_concept.test_paper_questions.new
    @group = Group.find(params[:group])

  end

  # GET /test_paper_questions/1/edit
  def edit
  end

  # POST /test_paper_questions
  # POST /test_paper_questions.json
  def create
    @group = Group.find(params[:group_id])
    @customized_concept = CustomizedConcept.find(params[:customized_concept_id])
    @test_paper_question = @customized_concept.test_paper_questions.new(test_paper_question_params)

    respond_to do |format|
      if @test_paper_question.save
        format.html { redirect_to group_course_path(@group, @customized_concept.course), notice: 'Test paper question was successfully created.' }
        format.json { render :show, status: :created, location: @test_paper_question }
      else
        format.html { render :new }
        format.json { render json: @test_paper_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_paper_questions/1
  # PATCH/PUT /test_paper_questions/1.json
  def update
    respond_to do |format|
      if @test_paper_question.update(test_paper_question_params)
        format.html { redirect_to @test_paper_question, notice: 'Test paper question was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_paper_question }
      else
        format.html { render :edit }
        format.json { render json: @test_paper_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_paper_questions/1
  # DELETE /test_paper_questions/1.json
  def destroy
    @test_paper_question.destroy
    respond_to do |format|
      format.html { redirect_to test_paper_questions_url, notice: 'Test paper question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def build_by_database
    @customized_concept = CustomizedConcept.find(params[:customized_concept_id])
  end

  def search_test
    @customized_concept = CustomizedConcept.find(params[:customized_concept_id])
    @test_paper_questions = TestPaperQuestion.tagged_with(params[:keyword])
    @keyword = params[:keyword]
    
    respond_to do |format|
      format.js
    end
  end

  def add_test
    @customized_concept = CustomizedConcept.find(params[:customized_concept_id])
    @course = @customized_concept.course
    @group = @course.group
    @test_paper_question = TestPaperQuestion.find(params[:test_paper_question_id])
    @new_question = @test_paper_question.dup

    @new_question.customized_concept_id = @customized_concept.id

    # FIXME : 
    @new_question.question = File.open(@test_paper_question.question.path)
    @new_question.save
    copy_test_paper_option(@new_question, @test_paper_question)

    respond_to do |format|
      format.html { redirect_to group_course_path(@group, @course) }
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

  def test_preview
    @test = TestPaperQuestion.find(params[:test_paper_question_id])
    respond_to do |format|
      format.js
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_paper_question
      @test_paper_question = TestPaperQuestion.first

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_paper_question_params
      params.require(:test_paper_question).permit(:id,
                                                  :question,
                                                  :customized_concept_id,
                                                  test_paper_options_attributes: [:id, :answer, :test_paper_question_id, :question_number]
                                                )
    end
end
