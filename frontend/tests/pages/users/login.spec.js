import { mount } from '@vue/test-utils'
import loginWithAuthModule from '@/pages/users/login.vue'

describe('login check with right data', () => {
    it("login check with right data", () => {
        const wrapper = mount(loginWithAuthModule)
        wrapper = mount(<loginWithAuthModule />);
        wrapper
          .find('input[type="text"]')
          .simulate("change", { target: { id: "username", value: "world" } });
        wrapper
          .find('input[type="password"]')
          .simulate("change", { target: { id: "password", value: "123" } });
        wrapper.find("button").simulate("click");
        expect(wrapper.state("loggedIn")).toBe(true);
    });
})