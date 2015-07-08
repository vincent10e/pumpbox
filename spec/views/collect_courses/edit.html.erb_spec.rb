require 'rails_helper'

RSpec.describe "collect_courses/edit", type: :view do
  before(:each) do
    @collect_course = assign(:collect_course, CollectCourse.create!(
      :teacher_id => 1,
      :title => "MyString",
      :overview => "MyText",
      :education_level_id => 1,
      :subject_id => 1,
      :group_id => 1,
      :volume_id => 1,
      :image => "MyString",
      :is_open => false
    ))
  end

  it "renders the edit collect_course form" do
    render

    assert_select "form[action=?][method=?]", collect_course_path(@collect_course), "post" do

      assert_select "input#collect_course_teacher_id[name=?]", "collect_course[teacher_id]"

      assert_select "input#collect_course_title[name=?]", "collect_course[title]"

      assert_select "textarea#collect_course_overview[name=?]", "collect_course[overview]"

      assert_select "input#collect_course_education_level_id[name=?]", "collect_course[education_level_id]"

      assert_select "input#collect_course_subject_id[name=?]", "collect_course[subject_id]"

      assert_select "input#collect_course_group_id[name=?]", "collect_course[group_id]"

      assert_select "input#collect_course_volume_id[name=?]", "collect_course[volume_id]"

      assert_select "input#collect_course_image[name=?]", "collect_course[image]"

      assert_select "input#collect_course_is_open[name=?]", "collect_course[is_open]"
    end
  end
end
