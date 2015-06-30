class CustomizedConceptsController < ApplicationController
  before_action :set_customized_concept, only: [:show, :edit, :update, :destroy]

  # GET /customized_concepts
  # GET /customized_concepts.json
  def index
    @course = Course.find(params[:course_id])
    @customized_concepts = @course.customized_concepts
  end

  # GET /customized_concepts/1
  # GET /customized_concepts/1.json
  def show
    @course = Course.find(params[:course_id])
    @customized_concepts = @course.customized_concepts
    @customized_concept ||= CustomizedConcept.find(params[:id])
    @next_concept = @customized_concept.next
    @prev_concept = @customized_concept.previous

    @group = Group.find(params[:group_id]) if params[:group_id]
  end

  # GET /customized_concepts/new
  def new
    @course = Course.find(params[:course_id])
    @customized_concept = @course.customized_concepts.new
    @database_tests = Test.all # TO-DO :  like @chapter.test

    @chapters = Subject.find(@course.subject_id).chapters 
  end

  # GET /customized_concepts/1/editg
  def edit
    @course = Course.find(params[:course_id])
    @customized_concept = @course.customized_concepts.find(params[:id])
    @tests = @customized_concept.tests
    @test_paper_questions = @customized_concept.test_paper_questions
  end

  # POST /customized_concepts
  # POST /customized_concepts.json
  def create
    @course = Course.find(params[:course_id])
    @customized_concept = @course.customized_concepts.new(customized_concept_params)
    
    respond_to do |format|
      if @customized_concept.save
        format.html { redirect_to course_customized_concepts_path(@course.id), notice: 'Customized concept was successfully created.' }
        # format.json { render :show, status: :created, location: @customized_concept }
      else
        format.html { render :new }
        format.json { render json: @customized_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customized_concepts/1
  # PATCH/PUT /customized_concepts/1.json
  def update
    @course = Course.find(params[:course_id])
    @customized_concept = CustomizedConcept.find(params[:id])
    

    if !params[:customized_concept][:test_paper_questions_attributes][:"0"].blank?
      test_paper_options_attributes = params[:customized_concept][:test_paper_questions_attributes][:"0"][:test_paper_options_attributes]
      test_paper_options_attributes.each_value do |v|
        t = TestPaperOption.find(v[:id].to_i)
        t.answer = v[:answer]
        t.save!
      end
    end

    respond_to do |format|
      if @customized_concept.update!(customized_concept_params)
        format.html { redirect_to course_customized_concepts_path(@course), notice: 'Customized concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @customized_concept }
      else
        format.html { render :edit }
        format.json { render json: @customized_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customized_concepts/1
  # DELETE /customized_concepts/1.json
  def destroy
    @course = Course.find(params[:course_id])
    @customized_concept.destroy
    respond_to do |format|
      format.html { redirect_to course_customized_concepts_path(@course), notice: 'Customized concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def student_detail
    # for test attempt
    @concept = CustomizedConcept.find(params[:customized_concept_id])
    @tests = @concept.tests
    @test_attempts = @concept.test_attempts.where(user: params[:user_id], customized_concept_id: @concept.id)

    # for test paper
    @test_paper = @concept.test_papers.last
  
  end

  def paper_option
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customized_concept
      @customized_concept = CustomizedConcept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customized_concept_params
      params.require(:customized_concept).permit(:course_id, 
                                                :title, 
                                                :description,
                                                :video,
                                                :lecture,
                                                tests_attributes: [:id,
                                                                   :question,
                                                                   :tip,
                                                                   :_destroy,
                                                                   :related_video,
                                                                   options_attributes: [:id, 
                                                                                        :description, 
                                                                                        :is_answer]
                                                                   ],
                                                test_paper_questions_attributes: [
                                                                    :id,
                                                                    :question,
                                                                    :customized_concept_id,
                                                                    test_paper_options_attributes: [:id, :answer, :test_paper_question_id, :question_number]
                                                                  ])
    end
end
