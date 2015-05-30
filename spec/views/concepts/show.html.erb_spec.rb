require 'rails_helper'

RSpec.describe "concepts/show", type: :view do
  before(:each) do
    @concept = assign(:concept, Concept.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
