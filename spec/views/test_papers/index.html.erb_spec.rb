require 'rails_helper'

RSpec.describe "test_papers/index", type: :view do
  before(:each) do
    assign(:test_papers, [
      TestPaper.create!(
        :customized_concept_id => 1,
        :user => 2
      ),
      TestPaper.create!(
        :customized_concept_id => 1,
        :user => 2
      )
    ])
  end

  it "renders a list of test_papers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
