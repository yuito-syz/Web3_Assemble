RSpec.describe "UsersLogins", type: :system do
    scenario 'Don\'t login when user submits invalid information' do
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: ' '
        click_button 'Log in'
        aggregate_failures do
            expect(current_path).to eq login_path
            expect(has_css?('.alert-danger')).to be_truthy
            visit current_path
            expect(has_css?('.alert-danger')).to be_falsy
        end
        click_on 'Log out'
    end
end