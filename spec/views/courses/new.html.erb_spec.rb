require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :teacher_id => 1,
      :title => "MyString",
      :overview => "MyText"
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input#course_teacher_id[name=?]", "course[teacher_id]"

      assert_select "input#course_title[name=?]", "course[title]"

      assert_select "textarea#course_overview[name=?]", "course[overview]"
    end
  end
end
