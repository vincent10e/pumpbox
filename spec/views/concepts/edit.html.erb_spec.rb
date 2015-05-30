require 'rails_helper'

RSpec.describe "concepts/edit", type: :view do
  before(:each) do
    @concept = assign(:concept, Concept.create!())
  end

  it "renders the edit concept form" do
    render

    assert_select "form[action=?][method=?]", concept_path(@concept), "post" do
    end
  end
end
