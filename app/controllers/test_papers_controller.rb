class TestPapersController < ApplicationController
  before_action :set_test_paper, only: [:show, :edit, :update, :destroy]

  # GET /test_papers
  # GET /test_papers.json
  def index
    @test_papers = TestPaper.all
  end

  # GET /test_papers/1
  # GET /test_papers/1.json
  def show
  end

  # GET /test_papers/new
  def new
    @concept = CustomizedConcept.find(params[:customized_concept_id])
    @test_paper = @concept.test_papers.build
    @test_paper.user = current_user.id
    @test_paper.test_time_sec = Time.now().to_i
    @question_url = @concept.test_paper_questions.first.question.url
    @question = @concept.test_paper_questions.first
    @options = @question.test_paper_options

    @options.count.times do |i|
      @test_paper.paper_answer_records.build(test: i+1)
    end
  end

  # GET /test_papers/1/edit
  def edit
  end

  # POST /test_papers
  # POST /test_papers.json
  def create
    @concept = CustomizedConcept.find(params[:test_paper][:customized_concept_id])
    @test_paper = TestPaper.new(test_paper_params)
    @course = @concept.course
    @question_url = @concept.test_paper_questions.first.question.url
    @question = @concept.test_paper_questions.first
    @options = @question.test_paper_options
    @answer_records = @test_paper.paper_answer_records
    @error_test = check_answer(params[:select_answers], @options, params[:skip], @answer_records)

    respond_to do |format|
      if (@error_test.length == 0)
        @test_paper.test_time_sec = Time.now.to_i - @test_paper.test_time_sec
        if @test_paper.save
          @notice = notice_message(@test_paper.retry_time, @concept.point)
          format.html { redirect_to course_customized_concept_path(@course, @concept), notice: @notice}
          format.json { render :show, status: :created, location: @test_paper }
        else
          format.html { render :new }
        end
      else
        @test_paper.retry_time += 1
        @error_test.each do |e|
          @answer_records.each do |a|
            a.error_times += 1 if a.test == e
          end
        end
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /test_papers/1
  # PATCH/PUT /test_papers/1.json
  def update
    respond_to do |format|
      if @test_paper.update(test_paper_params)
        format.html { redirect_to @test_paper, notice: 'Test paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_paper }
      else
        format.html { render :edit }
        format.json { render json: @test_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_papers/1
  # DELETE /test_papers/1.json
  def destroy
    @test_paper.destroy
    respond_to do |format|
      format.html { redirect_to test_papers_url, notice: 'Test paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def paper_option
    
    respond_to do |format|
      format.js
    end  
  end

  def check_answer(select_answers, right_answer, skip_num, answer_records)
    error_test = []
    select_answers.each_pair do |number, answer|
      if answer.to_i != right_answer.find_by_question_number(number.to_i).answer
        if !skip_num.blank? && skip_num.include?(number.to_s) # student select the skip check_box
          answer_records.each do |a|
            a.is_skip = true if a.test == number.to_i
          end
        else  # student select wrong anser, it will record test number and record selected option which is student choose
          error_test << number.to_i
          # record every select
          answer_records.each do |a|
            if a[:test] == number.to_i
              for i in 1..5
                if a[:"select_record_#{i}"].blank?
                  a[:"select_record_#{i}"] = number_to_letter(answer)
                  break
                end
              end
            end
          end
        end
      end
    end
    return error_test
  end

  def number_to_letter(answer)
    case answer.to_i
    when 1
      "A"
    when 2
      "B"
    when 3
      "C"
    when 4
      "D"
    when 5
      "E"
    when 6
      "F"
    end
  end

  def notice_message(retry_time, point)
    if retry_time == 1
      "恭喜一次就通過測驗，獲得P幣 : " + point.to_s
    else
      'Successfully pass'
    end
  end
  

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_test_paper
      @test_paper = TestPaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_paper_params
      params.require(:test_paper).permit(:customized_concept_id, 
                                         :user,
																				 :retry_time,
                                         :test_time_sec,
                                         paper_answer_records_attributes: [:id, :test, :error_times, :select_record_1, :select_record_2, :select_record_3, :select_record_4, :select_record_5])
    end
end
