<template>
  <div class="mt-16 px-16 mx-auto xl:max-w-3xl">
    <h2 class="text-center text-4xl text-indigo-900 font-display font-semibold lg:text-left xl:text-5xl
      xl:text-bold">
      Log in
    </h2>
    <div class="mt-12">
      <div class="mt-8">
        <div class="flex justify-between items-center">
          <div class="text-sm font-bold text-gray-700 tracking-wide">
            Email
          </div>
        </div>
        <input class="w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" v-model="email" type="email" placeholder="Enter your Email">
      </div>
      <div class="mt-8">
        <div class="flex justify-between items-center">
          <div class="text-sm font-bold text-gray-700 tracking-wide">
            Password
          </div>
        </div>
        <input class="w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" v-model="password" type="password" placeholder="Enter your password">
      </div>
      <div class="mt-10">
        <button class="bg-indigo-500 text-gray-100 p-4 w-full rounded-full tracking-wide
                       font-semibold font-display focus:outline-none focus:shadow-outline
                       hover:bg-indigo-600 shadow-lg"
                @click="handleLogin"
        >
          Log In
        </button>
      </div>
    </div>
  </div>
</template>
  
<script lang="ts">
  import { defineComponent, reactive, toRefs } from 'vue'
  import { login } from '@/api/auth'
  import router from '@/router'
  
  export default defineComponent({
    name: 'Home',
    setup () {
      const formData = reactive({
        email: '',
        password: ''
      })
  
      return {
        ...toRefs(formData),
        handleLogin: async () => {
          await login(formData.email, formData.password)
            .then((res) => {
              if (res?.status === 200) {
                router.push('/posts') 
              } else {
                alert('メールアドレスかパスワードが間違っています。')
              }
            })
            .catch(() => {
              alert('ログインに失敗しました。')
            })
        }
      }
    }
  })
</script>
  