require 'rails_helper'

RSpec.describe "collect_courses/show", type: :view do
  before(:each) do
    @collect_course = assign(:collect_course, CollectCourse.create!(
      :teacher_id => 1,
      :title => "Title",
      :overview => "MyText",
      :education_level_id => 2,
      :subject_id => 3,
      :group_id => 4,
      :volume_id => 5,
      :image => "Image",
      :is_open => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
  end
end
