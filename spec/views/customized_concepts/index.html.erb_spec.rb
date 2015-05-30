require 'rails_helper'

RSpec.describe "customized_concepts/index", type: :view do
  before(:each) do
    assign(:customized_concepts, [
      CustomizedConcept.create!(
        :course_id => 1,
        :title => "Title",
        :description => "MyText",
        :video => "Video",
        :lecture => "Lecture"
      ),
      CustomizedConcept.create!(
        :course_id => 1,
        :title => "Title",
        :description => "MyText",
        :video => "Video",
        :lecture => "Lecture"
      )
    ])
  end

  it "renders a list of customized_concepts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
    assert_select "tr>td", :text => "Lecture".to_s, :count => 2
  end
end
