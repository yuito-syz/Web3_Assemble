<template>
  <div class="mt-16 px-16 mx-auto xl:max-w-3xl">
    <h2 class="text-center text-4xl text-indigo-900 font-display font-semibold lg:text-left xl:text-5xl
      xl:text-bold">
      Login
    </h2>
    <div v-if="requiredTwoFactorAuth" class="mt-12">
      <div class="mt-8">
        <div class="flex justify-between items-center">
          <div class="text-sm font-bold text-gray-700 tracking-wide">
            OtpCode
          </div>
        </div>
        <input class="w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" v-model="otp_code" type="password" placeholder="Enter your OtpCode">
      </div>
      <div class="mt-10">
        <button class="bg-indigo-500 text-gray-100 p-4 w-full rounded-full tracking-wide
                       font-semibold font-display focus:outline-none focus:shadow-outline
                       hover:bg-indigo-600 shadow-lg"
                @click="handleLogin"
        >
          Login
        </button>
      </div>
    </div>
    <div v-else class="mt-12">
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
          Login
        </button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
/* eslint-disable @typescript-eslint/camelcase */

import { defineComponent, reactive, ref, toRefs } from 'vue'
import { login } from '@/api/auth'
import router from '@/router'
import { useState } from '@/state/use-state'

export default defineComponent({
  name: 'Login',
  setup () {
    const state = useState()
    const formData = reactive({
      email: '',
      password: '',
      otp_code: ''
    })

    const requiredTwoFactorAuth = ref(false)

    const handleLogin = async () => {
      await login(formData.email, formData.password, formData.otp_code)
        .then((res) => {
          if (res?.data.two_factor_auth) {
            requiredTwoFactorAuth.value = true
          } else {
            if (res?.status === 200) {
              state.setAuthState(res?.headers)
              router.push('/')
            } else {
              alert('メールアドレスかパスワードが間違っています。')
            }
          }
        })
        .catch((e) => {
          console.error(e)
          alert('ログインに失敗しました。')
        })
    }

    return {
      ...toRefs(formData),
      requiredTwoFactorAuth,
      handleLogin
    }
  }
})
</script>
