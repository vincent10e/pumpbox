class CustomizedConceptsController < ApplicationController
  before_action :set_customized_concept, only: [:show, :edit, :update, :destroy]

  # GET /customized_concepts
  # GET /customized_concepts.json
  def index
    @customized_concepts = CustomizedConcept.all
  end

  # GET /customized_concepts/1
  # GET /customized_concepts/1.json
  def show
    @course = Course.find(params[:course_id])
    @customized_concept = @course.customized_concepts.find(params[:id])
  end

  # GET /customized_concepts/new
  def new
    @customized_concept = CustomizedConcept.new
    @course = Course.find(params[:course_id])
    
    @customized_concept = @course.customized_concepts.new
    @tests = Test.all # TO-DO :  like @chapter.test

    @chapters = Subject.find(@course.subject_id).chapters 
  end

  # GET /customized_concepts/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @customized_concept = @course.customized_concepts.find(params[:id])
  end

  # POST /customized_concepts
  # POST /customized_concepts.json
  def create
    @course = Course.find(params[:course_id])
    @customized_concept = @course.customized_concepts.new(customized_concept_params)

    respond_to do |format|
      if @customized_concept.save
        format.html { redirect_to @course, notice: 'Customized concept was successfully created.' }
        format.json { render :show, status: :created, location: @customized_concept }
      else
        format.html { render :new }
        format.json { render json: @customized_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customized_concepts/1
  # PATCH/PUT /customized_concepts/1.json
  def update
    respond_to do |format|
      if @customized_concept.update(customized_concept_params)
        format.html { redirect_to @customized_concept, notice: 'Customized concept was successfully updated.' }
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
    @customized_concept.destroy
    respond_to do |format|
      format.html { redirect_to customized_concepts_url, notice: 'Customized concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customized_concept
      @customized_concept = CustomizedConcept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customized_concept_params
      params.require(:customized_concept).permit(:course_id, :title, :description, :video, :lecture)
    end
end
