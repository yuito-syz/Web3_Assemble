import { mount } from '@vue/test-utils'
import userFormEmail from '@/components/user/userFormEmail.vue'

describe('userFormEmail', () => {
  it('Emailアドレスが正しく作成された。', () => {
      const wrapper = mount(userFormEmail)
      wrapper = mount(<userFormEmail />);
      wrapper.find('input[type="text"]').simulate("change", {
        target: { id: "username", value: "world" }
      });
      expect(wrapper.state("username")).toEqual("world");
  });
})