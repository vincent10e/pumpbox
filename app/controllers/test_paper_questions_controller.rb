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
        format.html { redirect_to course_customized_concepts_path(@customized_concept.course), notice: 'Test paper question was successfully created.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_paper_question
      @test_paper_question = TestPaperQuestion.find(params[:id])
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
