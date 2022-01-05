require 'rails_helper'

RSpec.describe "word_of_mouths/new", type: :view do
  before(:each) do
    assign(:word_of_mouth, WordOfMouth.new())
  end

  it "renders new word_of_mouth form" do
    render

    assert_select "form[action=?][method=?]", word_of_mouths_path, "post" do
    end
  end
end
