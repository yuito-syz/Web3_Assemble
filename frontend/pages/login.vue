<template>
  <bef-login-form-card>
  <template v-slot:form-card-content>
    <v-form
      ref="form"
      v-model="isValid"
    >
      <user-form-email
        :email.sync="params.auth.email"
        no-validation
      />
      <user-form-password
        :password.sync="params.auth.password"
        no-validation
      />
    </v-form>
  </template>
  </bef-login-form-card>
</template>

<script>
export default {
  layout: 'beforeLogin',
  methods: {
    login () {
      this.loading = true
      setTimeout(() => {
        this.$store.dispatch('login')
        this.$router.replace('/')
        this.loading = false
      }, 1500)
    }
  }
}
</script>