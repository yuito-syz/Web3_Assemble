<template>
  <bef-login-form-card>
    <template v-slot:form-card-content>
      <toaster />
      <v-form ref="form" lazy-validation>
        <v-text-field
          v-model="email"
          prepend-icon="mdi-email"
          label="メールアドレス"
        />
        <v-text-field
          v-model="password"
          prepend-icon="mdi-lock"
          append-icon="mdi-eye-off"
          label="パスワード"
        />
        <v-card-actions>
          <v-btn
            color="light-green darken-1"
            class="white--text"
            @click="loginWithAuthModule"
          >
            ログイン
          </v-btn>
        </v-card-actions>
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
      password: '',
      email: '',
    }
  },
  methods: {
    async loginWithAuthModule() {
      await this.$auth
        .loginWith('local', {
          data: {
            email: this.email,
            password: this.password,
          },
        })
        .then(
          (response) => {
            localStorage.setItem('access-token', response.headers['access-token'])
            localStorage.setItem('client', response.headers.client)
            localStorage.setItem('uid', response.headers.uid)
            localStorage.setItem('token-type', response.headers['token-type'])
            return response
          },
          (error) => {
            return error
          }
        )
    },
  },
}
</script>