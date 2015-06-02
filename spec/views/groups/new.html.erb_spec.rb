require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :teacher_id => 1,
      :name => "MyString",
      :group_code => "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input#group_teacher_id[name=?]", "group[teacher_id]"

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_group_code[name=?]", "group[group_code]"
    end
  end
end
