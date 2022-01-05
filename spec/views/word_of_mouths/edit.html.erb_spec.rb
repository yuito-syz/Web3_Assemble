require 'rails_helper'

RSpec.describe "word_of_mouths/edit", type: :view do
  before(:each) do
    @word_of_mouth = assign(:word_of_mouth, WordOfMouth.create!())
  end

  it "renders the edit word_of_mouth form" do
    render

    assert_select "form[action=?][method=?]", word_of_mouth_path(@word_of_mouth), "post" do
    end
  end
end
