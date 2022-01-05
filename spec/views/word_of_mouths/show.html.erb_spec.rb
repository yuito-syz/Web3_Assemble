require 'rails_helper'

RSpec.describe "word_of_mouths/show", type: :view do
  before(:each) do
    @word_of_mouth = assign(:word_of_mouth, WordOfMouth.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
