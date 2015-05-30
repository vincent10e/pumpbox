require 'rails_helper'

RSpec.describe "concepts/new", type: :view do
  before(:each) do
    assign(:concept, Concept.new())
  end

  it "renders new concept form" do
    render

    assert_select "form[action=?][method=?]", concepts_path, "post" do
    end
  end
end
