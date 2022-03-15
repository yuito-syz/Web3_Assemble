import { mount } from '@vue/test-utils'
import userFormName from '@/components/user/userFormName.vue'

describe('userFormName', () => {
  it('ユーザー名が正しく作成された。', () => {
      const wrapper = mount(userFormName)
      wrapper = mount(<userFormEmail />);
      wrapper.find('input[type="text"]').simulate("change", {
        target: { id: "username", value: "world" }
      });
      expect(wrapper.state("username")).toEqual("world");
  });
})