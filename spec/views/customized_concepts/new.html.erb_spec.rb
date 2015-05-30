require 'rails_helper'

RSpec.describe "customized_concepts/new", type: :view do
  before(:each) do
    assign(:customized_concept, CustomizedConcept.new(
      :course_id => 1,
      :title => "MyString",
      :description => "MyText",
      :video => "MyString",
      :lecture => "MyString"
    ))
  end

  it "renders new customized_concept form" do
    render

    assert_select "form[action=?][method=?]", customized_concepts_path, "post" do

      assert_select "input#customized_concept_course_id[name=?]", "customized_concept[course_id]"

      assert_select "input#customized_concept_title[name=?]", "customized_concept[title]"

      assert_select "textarea#customized_concept_description[name=?]", "customized_concept[description]"

      assert_select "input#customized_concept_video[name=?]", "customized_concept[video]"

      assert_select "input#customized_concept_lecture[name=?]", "customized_concept[lecture]"
    end
  end
end
