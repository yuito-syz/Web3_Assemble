<template>
  <v-btn
    text
    plain
    class="text-decoration-underline"
    @click="guestLogin"
  >
    ゲストとしてログイン
  </v-btn>
</template>

<script>
export default {
  data () {
    return {
      loading: false,
    }
  },
  methods: {
    async guestLogin () {
      this.loading = true
      await this.$axios.$post('/api/v1/users/guest_sign_in')
        .then((res) => {
          this.$auth.loginWith('guestlogin', { data: res.data }) 
          this.$router.push(this.$store.state.rememberRoute)
          this.loading = false
        })
    }
  }
}
</script>