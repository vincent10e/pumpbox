require 'rails_helper'

RSpec.describe "collect_courses/index", type: :view do
  before(:each) do
    assign(:collect_courses, [
      CollectCourse.create!(
        :teacher_id => 1,
        :title => "Title",
        :overview => "MyText",
        :education_level_id => 2,
        :subject_id => 3,
        :group_id => 4,
        :volume_id => 5,
        :image => "Image",
        :is_open => false
      ),
      CollectCourse.create!(
        :teacher_id => 1,
        :title => "Title",
        :overview => "MyText",
        :education_level_id => 2,
        :subject_id => 3,
        :group_id => 4,
        :volume_id => 5,
        :image => "Image",
        :is_open => false
      )
    ])
  end

  it "renders a list of collect_courses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
