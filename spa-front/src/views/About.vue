<template>
  <div class="mt-16 px-16 mx-auto xl:max-w-3xl">
    <h2 class="text-center text-4xl text-indigo-900 font-display font-semibold lg:text-left xl:text-5xl
      xl:text-bold">
      アカウント
    </h2>
    <div class="mt-12">
      <div class="mt-8">
        <div class="flex justify-between items-center">
          <div class="text-sm font-bold text-gray-700 tracking-wide">
            2要素認証
          </div>
        </div>
        <p v-if='account.otp_required_for_login'>設定済み</p>
        <p v-else>設定する</p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, ref } from 'vue'
import { getAccount } from '@/api/user'
import { User } from '@/types/user'

export default defineComponent({
  name: 'Account',
  setup () {
    const account = ref({} as User)
    const onGetAccount = async () => {
      await getAccount()
        .then((res) => {
          account.value = res.data
        })
    }

    onMounted(() => {
      onGetAccount()
    })

    return {
      account
    }
  }
})
</script>
