RSpec.describe "StaticPages", type: :system do
    scenario "If you access '/', the title is 'Ruby on Rails Tutorial'." do
      visit root_path
      expect(page.title).to eq "Home | Ruby on Rails Tutorial"
      expect(page).to have_link 'Home',       href: root_path
      expect(page).to have_link 'sample app', href: root_path
      expect(page).to have_link 'Help',       href: help_path
      expect(page).to have_link 'About',      href: about_path
      expect(page).to have_link 'Contact',    href: contact_path
      expect(page).to have_link 'Sign up now!',     href: signup_path
    end
end