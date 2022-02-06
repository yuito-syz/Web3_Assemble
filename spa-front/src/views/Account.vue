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
        <p v-else><button @click='getQrCode()'>設定する</button></p>
        <div v-if="qrCode">
          <vue-qrcode :value="qrCode" />
          <div class="mt-8">
            <div class="flex justify-between items-center">
              <div class="text-sm font-bold text-gray-700 tracking-wide">
                認証コード
              </div>
            </div>
            <input class="w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" v-model="otp_code" type="password" placeholder="Enter your otp code">
            <div class="mt-10">
              <button class="bg-indigo-500 text-gray-100 p-4 w-full rounded-full tracking-wide
                            font-semibold font-display focus:outline-none focus:shadow-outline
                            hover:bg-indigo-600 shadow-lg"
                      @click="handleVerifyOtpCode()"
              >
                認証する
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, reactive, ref, toRefs } from 'vue'
import { getAccount, createQrCode, verifyOtpCode } from '@/api/user'
import { User } from '@/types/user'
import router from '@/router'

export default defineComponent({
  name: 'Account',
  setup () {
    const account = ref({} as User)
    const qrCode = ref('')
    const formData = reactive({
      // eslint-disable-next-line @typescript-eslint/camelcase
      otp_code: ''
    })

    const onGetAccount = async () => {
      await getAccount()
        .then((res) => {
          account.value = res.data
        })
    }

    const getQrCode = async () => {
      await createQrCode()
        .then((res) => {
          qrCode.value = res.data.otp_uri
        })
    }

    const handleVerifyOtpCode = async () => {
      await verifyOtpCode(formData.otp_code)
        .then(() => {
          router.push('/')
          alert('2要素認証の設定に成功しました。')
        })
    }

    onMounted(() => {
      onGetAccount()
    })

    return {
      account,
      qrCode,
      getQrCode,
      ...toRefs(formData),
      handleVerifyOtpCode
    }
  }
})
</script>
