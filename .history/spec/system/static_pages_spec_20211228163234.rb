RSpec.describe "StaticPages", type: :system do
    scenario "「/」 にアクセスした場合,タイトルは「Ruby on Rails Tutorial Sample App」です" do
      visit root_path
      expect(page.title).to eq "Ruby on Rails Tutorial Sample App"
    end
  end