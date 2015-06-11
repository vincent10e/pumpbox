require 'rails_helper'

RSpec.describe "test_attempts/show", type: :view do
  before(:each) do
    @test_attempt = assign(:test_attempt, TestAttempt.create!(
      :customized_concept_id => 1,
      :user => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
