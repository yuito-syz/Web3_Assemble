import { mount } from '@vue/test-utils'
import userFormPassword from '@/components/user/userFormPassword.vue'

describe('userFormPassword', () => {
    it('パスワードが正しく作成された。', () => {
        const wrapper = mount(userFormPassword)
        wrapper = mount(<userFormPassword />);
        wrapper.find('input[type="text"]').simulate("change", {
            target: { id: "password", value: "123" }
        });
        expect(wrapper.state("password")).toEqual("123");
    });
})