require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :teacher_id => 1,
      :name => "MyString",
      :group_code => "MyString"
    ))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do

      assert_select "input#group_teacher_id[name=?]", "group[teacher_id]"

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_group_code[name=?]", "group[group_code]"
    end
  end
end
