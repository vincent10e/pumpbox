require 'rails_helper'

RSpec.describe "test_paper_questions/show", type: :view do
  before(:each) do
    @test_paper_question = assign(:test_paper_question, TestPaperQuestion.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
