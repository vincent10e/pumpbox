require 'rails_helper'

RSpec.describe "test_attempts/edit", type: :view do
  before(:each) do
    @test_attempt = assign(:test_attempt, TestAttempt.create!(
      :customized_concept_id => 1,
      :user => 1
    ))
  end

  it "renders the edit test_attempt form" do
    render

    assert_select "form[action=?][method=?]", test_attempt_path(@test_attempt), "post" do

      assert_select "input#test_attempt_customized_concept_id[name=?]", "test_attempt[customized_concept_id]"

      assert_select "input#test_attempt_user[name=?]", "test_attempt[user]"
    end
  end
end
