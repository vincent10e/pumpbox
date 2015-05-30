require 'rails_helper'

RSpec.describe "customized_concepts/show", type: :view do
  before(:each) do
    @customized_concept = assign(:customized_concept, CustomizedConcept.create!(
      :course_id => 1,
      :title => "Title",
      :description => "MyText",
      :video => "Video",
      :lecture => "Lecture"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Video/)
    expect(rendered).to match(/Lecture/)
  end
end
