require 'rails_helper'

RSpec.describe "test_paper_questions/index", type: :view do
  before(:each) do
    assign(:test_paper_questions, [
      TestPaperQuestion.create!(),
      TestPaperQuestion.create!()
    ])
  end

  it "renders a list of test_paper_questions" do
    render
  end
end
