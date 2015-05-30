require 'rails_helper'

RSpec.describe "concepts/index", type: :view do
  before(:each) do
    assign(:concepts, [
      Concept.create!(),
      Concept.create!()
    ])
  end

  it "renders a list of concepts" do
    render
  end
end
