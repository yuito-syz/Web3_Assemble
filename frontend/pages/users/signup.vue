<template>
  <bef-login-form-card>
    <template
      v-slot:form-card-content
    >
      <v-form ref="form" lazy-validation>
        <v-text-field
          v-model="user.email"
          prepend-icon="mdi-email"
          label="メールアドレス"
        />
        <v-text-field
          v-model="user.password"
          prepend-icon="mdi-lock"
          append-icon="mdi-eye-off"
          label="パスワード"
        />
        <v-text-field
          v-model="user.password_confirmation"
          prepend-icon="mdi-lock"
          append-icon="mdi-eye-off"
          label="パスワード確認"
        />
        <v-card-actions>
          <v-btn
            color="light-green darken-1"
            class="white--text"
            @click="registerUser"
          >
            新規登録
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
      user: {
        password: '',
        email: '',
        password_confirmation: '',
      },
    }
  },
  methods: {
    registerUser() {
      this.$axios.post('/api/v1/auth/sign_up', this.user).then((response) => {
        window.location.href = '/users/confirmation'
      })
    },
  },
}
</script>