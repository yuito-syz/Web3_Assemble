<template>
  <bef-login-form-card>
    <template v-slot:form-card-content>
      <toaster />
      <v-form ref="form" lazy-validation　v-model="isValid">
        <user-form-email
        :email.sync="params.auth.email"
        no-validation
        />
        <user-form-password
          :password.sync="params.auth.password"
          no-validation
        />
        <v-card-actions>
          <nuxt-link
            to="#"
            class="body-2 text-decoration-none"
          >
            パスワードを忘れた?
          </nuxt-link>
        </v-card-actions>
        <v-card-text class="px-0">
          <v-btn
            :disabled="!isValid || loading"
            :loading="loading"
            block
            color="light-green darken-1"
            class="white--text"
            @click="loginWithAuthModule"
          >
            ログイン
          </v-btn>
        </v-card-text>
      </v-form>
    </template>
  </bef-login-form-card>
</template>

<script>
export default {
  layout: 'beforeLogin',
  auth: false,
  data() {
    return {
      isValid: false,
      loading: false,
      params: { auth: { email: '', password: '' } }
    }
  },
  methods: {
    async loginWithAuthModule() {
      this.loading = true
      if (this.isValid) {
      await this.$auth
        .loginWith('local', this.params)
        .then(
          (response) => {
            localStorage.setItem('access-token', response.headers['access-token'])
            localStorage.setItem('client', response.headers.client)
            localStorage.setItem('expiry', response.headers.expiry)
            localStorage.setItem('uid', response.headers.uid)
            localStorage.setItem('token-type', response.headers['token-type'])
            return response
          },
          (error) => {
            return error
          }
        )
      }
      this.loading = false
    }
  }
}
</script>