require 'rails_helper'

RSpec.describe "word_of_mouths/index", type: :view do
  before(:each) do
    assign(:word_of_mouths, [
      WordOfMouth.create!(),
      WordOfMouth.create!()
    ])
  end

  it "renders a list of word_of_mouths" do
    render
  end
end
