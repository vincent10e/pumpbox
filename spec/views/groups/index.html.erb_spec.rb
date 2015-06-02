require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :teacher_id => 1,
        :name => "Name",
        :group_code => "Group Code"
      ),
      Group.create!(
        :teacher_id => 1,
        :name => "Name",
        :group_code => "Group Code"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Group Code".to_s, :count => 2
  end
end
