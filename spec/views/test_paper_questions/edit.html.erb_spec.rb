require 'rails_helper'

RSpec.describe "test_paper_questions/edit", type: :view do
  before(:each) do
    @test_paper_question = assign(:test_paper_question, TestPaperQuestion.create!())
  end

  it "renders the edit test_paper_question form" do
    render

    assert_select "form[action=?][method=?]", test_paper_question_path(@test_paper_question), "post" do
    end
  end
end
