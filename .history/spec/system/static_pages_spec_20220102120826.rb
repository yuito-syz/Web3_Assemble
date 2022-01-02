RSpec.describe "StaticPages", type: :system do
    scenario "If you access '/', the title is 'Ruby on Rails Tutorial'." do
      visit root_path
      expect(page.title).to eq "Ruby on Rails Tutorial"
    end
end