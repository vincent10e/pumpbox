require 'rails_helper'

RSpec.describe "test_paper_questions/new", type: :view do
  before(:each) do
    assign(:test_paper_question, TestPaperQuestion.new())
  end

  it "renders new test_paper_question form" do
    render

    assert_select "form[action=?][method=?]", test_paper_questions_path, "post" do
    end
  end
end
