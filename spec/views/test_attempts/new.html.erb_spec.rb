require 'rails_helper'

RSpec.describe "test_attempts/new", type: :view do
  before(:each) do
    assign(:test_attempt, TestAttempt.new(
      :customized_concept_id => 1,
      :user => 1
    ))
  end

  it "renders new test_attempt form" do
    render

    assert_select "form[action=?][method=?]", test_attempts_path, "post" do

      assert_select "input#test_attempt_customized_concept_id[name=?]", "test_attempt[customized_concept_id]"

      assert_select "input#test_attempt_user[name=?]", "test_attempt[user]"
    end
  end
end
