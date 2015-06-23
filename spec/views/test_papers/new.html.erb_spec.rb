require 'rails_helper'

RSpec.describe "test_papers/new", type: :view do
  before(:each) do
    assign(:test_paper, TestPaper.new(
      :customized_concept_id => 1,
      :user => 1
    ))
  end

  it "renders new test_paper form" do
    render

    assert_select "form[action=?][method=?]", test_papers_path, "post" do

      assert_select "input#test_paper_customized_concept_id[name=?]", "test_paper[customized_concept_id]"

      assert_select "input#test_paper_user[name=?]", "test_paper[user]"
    end
  end
end
